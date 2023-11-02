// create freezed payment model with string payment name, image url, and payment id, with freezed fromJson method

import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

@freezed
class PaymentModel with _$PaymentModel {
  const factory PaymentModel(
      {required String paymentName,
      required String paymentImgUrl,
      required String paymentId}) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
}
