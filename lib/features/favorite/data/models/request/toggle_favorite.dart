import 'package:json_annotation/json_annotation.dart';

part 'toggle_favorite.g.dart';

@JsonSerializable()
class ToggleFavoriteRequest {
  final String productId;

  ToggleFavoriteRequest({required this.productId});

  factory ToggleFavoriteRequest.fromJson(Map<String, dynamic> json) =>
      _$ToggleFavoriteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ToggleFavoriteRequestToJson(this);
}
