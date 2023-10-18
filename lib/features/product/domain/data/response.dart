import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class ProductResponse {
  final bool error;
  final String message;

  ProductResponse({required this.error, required this.message});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
