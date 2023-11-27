import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';

part 'toogle_favorite.g.dart';

@JsonSerializable()
class ToggleFavoriteResponse extends BaseResponse<ToggleFavoriteBody?> {
  ToggleFavoriteResponse(
      {required super.errors, required super.message, required super.data});

  factory ToggleFavoriteResponse.fromJson(Map<String, dynamic> json) =>
      _$ToggleFavoriteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ToggleFavoriteResponseToJson(this);
}

@JsonSerializable()
class ToggleFavoriteBody {
  final int? favoriteId;
  final String? productId;

  ToggleFavoriteBody({required this.favoriteId, required this.productId});
  factory ToggleFavoriteBody.fromJson(Map<String, dynamic> json) =>
      _$ToggleFavoriteBodyFromJson(json);
  Map<String, dynamic> toJson() => _$ToggleFavoriteBodyToJson(this);
}
