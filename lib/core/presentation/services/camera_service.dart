import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraService extends StateNotifier<File?> {
  CameraService() : super(null);

  Future<File?> openCamera() async {
    if (await Permission.camera.request().isGranted) {
      final picker = ImagePicker();
      final takedImage = await picker.pickImage(source: ImageSource.camera);
      if (takedImage == null) return null;
      state = File(takedImage.path);
      return File(takedImage.path);
    }
    return null;
  }

  Future<File?> openImagePicker() async {
    if (await Permission.photos.request().isGranted) {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return null;
      state = File(pickedImage.path);
      return File(pickedImage.path);
    }
    return null;
  }

  void discardCurrentFile() async {
    // create fake await
    await Future.delayed(const Duration(milliseconds: 500));
    state = null;
  }
}

/// provide list of avaiable camera that ready to use
final cameraServiceProvider =
    AutoDisposeStateNotifierProvider<CameraService, File?>(
        (ref) => CameraService());
