
import 'dart:io';

import 'package:rinjani_visitor/features/order/domain/entity/payment_method.dart';

class WisePaymentMethod implements PaymentMethod {
  final String bookingId;
  String? email;
  String? name;
  File? proofOfPayment;

  WisePaymentMethod(
      this.bookingId,
      );

  @override
  void fillData({String? field1, String? field2, File? file}) {
    email = field1;
    name = field2;
    proofOfPayment = file;
  }
}

class BankPaymentMethod implements PaymentMethod {
  final String bookingId;
  String? bankName;
  String? name;
  File? proofOfPayment;

  BankPaymentMethod(
      this.bookingId,
      );

  @override
  void fillData({String? field1, String? field2, File? file}) {
    bankName = field1;
    name = field2;
    proofOfPayment = file;
  }
}