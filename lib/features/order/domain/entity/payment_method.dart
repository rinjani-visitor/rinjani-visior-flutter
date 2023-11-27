import 'dart:io';

abstract class PaymentMethod {}

class WisePaymentMethod implements PaymentMethod {
  final String bookingId;
  String? email;
  String? name;
  File? proofOfPayment;

  WisePaymentMethod(
    this.bookingId,
  );
}

class BankPaymentMethod implements PaymentMethod {
  final String bookingId;
  String? bankName;
  String? name;
  File? proofOfPayment;

  BankPaymentMethod(
    this.bookingId,
  );
}
