import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraService extends StateNotifier<File?> {
  CameraService() : super(null);

  Future<File?> openCamera() async {
    if (await Permission.camera.request().isDenied) {
      return null;
    }
    final picker = ImagePicker();
    final takedImage = await picker.pickImage(source: ImageSource.camera);
    if (takedImage == null) return null;
    state = File(takedImage.path);
    return File(takedImage.path);
  }

  Future<File?> openImagePicker() async {
    if (await Permission.camera.request().isDenied) {
      return null;
    }
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return null;
    state = File(pickedImage.path);
    return File(pickedImage.path);
  }

  void discardCurrentFile() async {
    // create fake await, fix janky ui shift
    await Future.delayed(const Duration(milliseconds: 500));
    state = null;
  }
}

/// provide list of avaiable camera that ready to use
final cameraServiceProvider =
    StateNotifierProvider<CameraService, File?>((ref) => CameraService());
