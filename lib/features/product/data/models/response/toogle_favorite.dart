import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';

part 'toogle_favorite.g.dart';

@JsonSerializable()
class ToggleFavoriteResponse extends BaseResponse<String?> {
  ToggleFavoriteResponse(
      {required super.errors, required super.message, required super.data});

  factory ToggleFavoriteResponse.fromJson(Map<String, dynamic> json) =>
      _$ToggleFavoriteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ToggleFavoriteResponseToJson(this);
}
