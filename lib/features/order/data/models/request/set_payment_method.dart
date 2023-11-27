import 'package:json_annotation/json_annotation.dart';

part 'set_payment_method.g.dart';

@JsonSerializable()
class SetPaymentMethod {
  final String bookingId;
  final String method;

  SetPaymentMethod({required this.bookingId, required this.method});
  factory SetPaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$SetPaymentMethodFromJson(json);
  Map<String, dynamic> toJson() => _$SetPaymentMethodToJson(this);
}
