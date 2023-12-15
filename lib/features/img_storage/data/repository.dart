import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/constant/constant.dart';
import 'package:rinjani_visitor/core/constant/env.dart';
import 'package:rinjani_visitor/core/presentation/services/dio_service.dart';
import 'package:rinjani_visitor/features/img_storage/data/remote.dart';

final imgStorageRepository = Provider(
  (ref) => ImgStorageRepository(
    RemoteImgStorageDataSource(
      ref.read(authDioServiceProvider),
    ),
  ),
);

class ImgStorageRepository {
  final RemoteImgStorageDataSource _dataSource;

  ImgStorageRepository(this._dataSource);

  /// Upload image to imgur, return image link when success
  Future<String> uploadImage(File image) async {
    const id = "Client-ID ${Env.imgurlClientID}";
    final response = await _dataSource.uploadImage(id, image);
    return response.data!.link ?? " ";
  }
}
