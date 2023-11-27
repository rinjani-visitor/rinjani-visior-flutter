import 'package:json_annotation/json_annotation.dart';

part 'reset.g.dart';

@JsonSerializable()
class ResetRequest {
  final String email;

  ResetRequest({required this.email});
  factory ResetRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ResetRequestToJson(this);
}
