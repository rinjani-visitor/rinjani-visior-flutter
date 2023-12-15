import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rinjani_visitor/features/img_storage/data/response/upload_image.dart';

part 'remote.g.dart';

@RestApi(baseUrl: "https://api.imgur.com/3")
abstract class RemoteImgStorageDataSource {
  factory RemoteImgStorageDataSource(Dio dio, {String baseUrl}) =
      _RemoteImgStorageDataSource;

  @MultiPart()
  @POST("/image")
  Future<ImgStorageResponse> uploadImage(
    @Header("Authorization") String auth,
    @Part(name: "image") File image,
  );
}
