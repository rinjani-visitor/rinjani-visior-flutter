import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic_response.g.dart';

@JsonSerializable()
class BasicResponse {
  final String message;
  final List<String> error;

  BasicResponse({required this.error, required this.message});

  factory BasicResponse.fromJson(Map<String, dynamic> json) =>
      _$BasicResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BasicResponseToJson(this);
}
