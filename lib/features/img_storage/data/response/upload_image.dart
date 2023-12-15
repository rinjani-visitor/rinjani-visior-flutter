import 'package:json_annotation/json_annotation.dart';

part 'upload_image.g.dart';

@JsonSerializable()
class ImgStorageResponse {
  ImgStorageResponse({
    this.data,
    this.success,
    this.status,
  });

  factory ImgStorageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImgStorageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImgStorageResponseToJson(this);

  final ImgStorageResponseData? data;
  final bool? success;
  final int? status;
}

@JsonSerializable()
class ImgStorageResponseData {
  ImgStorageResponseData({
    required this.id,
    this.title,
    this.description,
    this.datetime,
    this.type,
    this.name,
    this.link,
  });

  factory ImgStorageResponseData.fromJson(Map<String, dynamic> json) =>
      _$ImgStorageResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImgStorageResponseDataToJson(this);

  final String id;
  final String? title;
  final String? description;
  final int? datetime;
  final String? type;
  final String? name;
  final String? link;
}
