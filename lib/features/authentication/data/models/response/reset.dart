import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';

part 'reset.g.dart';

@JsonSerializable()
class ResetResponse {
  final List<String> errors;
  final String message;
  ResetResponse({required this.errors, required this.message});

  factory ResetResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResetResponseToJson(this);
}
