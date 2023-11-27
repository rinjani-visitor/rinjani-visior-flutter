import 'package:json_annotation/json_annotation.dart';

part 'update_payment.g.dart';

@JsonSerializable()
class UpdatePaymentResponse {
  final List<String>? errors;
  final String? message;

  UpdatePaymentResponse({required this.errors, required this.message});

  factory UpdatePaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePaymentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UpdatePaymentResponseToJson(this);
}
