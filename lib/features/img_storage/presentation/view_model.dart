import 'dart:io';
import 'dart:developer' as developer;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/features/img_storage/data/repository.dart';

final imgStorageProvider =
    NotifierProvider<ImgStorageNotifier, String>(ImgStorageNotifier.new);

class ImgStorageNotifier extends Notifier<String> {
  ImgStorageRepository get repository => ref.read(imgStorageRepository);
  @override
  String build() {
    return "";
  }

  Future<void> uploadImage(File image) async {
    try {
      final response = await repository.uploadImage(image);
      state = response;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      developer.log(e.toString());
    }
  }
}
