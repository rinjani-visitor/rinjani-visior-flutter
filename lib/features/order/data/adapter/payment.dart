import 'dart:io';

import 'package:rinjani_visitor/features/order/data/models/request/set_payment_method.dart';
import 'package:rinjani_visitor/features/order/data/source/remote.dart';
import 'package:rinjani_visitor/features/order/domain/entity/payment_method.dart';

class WisePaymentMethod implements PaymentMethod {
  @override
  final String bookingId;
  String? email;
  String? name;
  File? proofOfPayment;

  WisePaymentMethod(
    this.bookingId,
  );

  /// fill data inside wise payment class, start with email, name, and file of proofOfPayment
  @override
  void fillData({String? field1, String? field2, File? file}) {
    email = field1;
    name = field2;
    proofOfPayment = file;
  }

  @override
  Future<String> submit(RemoteOrderSource remote, String token) async {
    await remote.setPaymentMethod(
        token, SetPaymentMethod(bookingId: bookingId, method: "Wise"));
    final result = await remote.uploadWisePayment(
      token,
      bookingId: bookingId,
      wiseEmail: email!,
      wiseAccountName: name!,
      imageProofTransfer: proofOfPayment!,
    );
    return result.message;
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

  /// fill data inside bank payment class, start with 'bank provider name', your
  /// 'bank account name', and file of 'proofOfPayment'
  @override
  void fillData({String? field1, String? field2, File? file}) {
    bankName = field1;
    name = field2;
    proofOfPayment = file;
  }

  @override
  Future<String> submit(RemoteOrderSource remote, String token) async {
    await remote.setPaymentMethod(
        token, SetPaymentMethod(bookingId: bookingId, method: "Bank"));
    final result = await remote.uploadBankPayment(
      token,
      bookingId: bookingId,
      bankName: bankName!,
      bankAccountName: name!,
      imageProofTransfer: proofOfPayment!,
    );
    return result.message;
  }
}
