import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraService extends StateNotifier<File?> {
  CameraService() : super(null);

  void openCamera() async {
    if (await Permission.camera.request().isGranted) {
      final picker = ImagePicker();
      final takedImage = await picker.pickImage(source: ImageSource.camera);
      if (takedImage == null) return;
      state = File(takedImage.path);
    }
  }

  void openImagePicker() async {
    if (await Permission.photos.request().isGranted) {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      state = File(pickedImage.path);
      return;
    }
  }

  void discardCurrentFile() async {
    // create fake await
    await Future.delayed(const Duration(milliseconds: 500));
    state = null;
  }
}

/// provide list of avaiable camera that ready to use
final cameraProvider = AutoDisposeStateNotifierProvider<CameraService, File?>(
    (ref) => CameraService());
