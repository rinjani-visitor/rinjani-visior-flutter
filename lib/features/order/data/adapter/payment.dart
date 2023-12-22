import 'dart:io';
import 'package:path/path.dart';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:rinjani_visitor/features/order/data/models/request/set_payment_method.dart';
import 'package:rinjani_visitor/features/order/data/models/request/upload_bank_payment.dart';
import 'package:rinjani_visitor/features/order/data/models/request/upload_wise_payment.dart';
import 'package:rinjani_visitor/features/order/data/source/remote.dart';
import 'package:rinjani_visitor/features/order/domain/entity/payment_method.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
    developer.log("Submit", name: runtimeType.toString());
    await remote.setPaymentMethod(
        token, SetPaymentMethod(bookingId: bookingId, method: "Wise"));

    final instance = FirebaseStorage.instance;

    String fileName = proofOfPayment!.path.split(Platform.pathSeparator).last;
    final instanceRef = instance.ref();
    final storageRef = instanceRef.child("payment/$bookingId/$fileName");
    final imgUrl = await storageRef.putFile(proofOfPayment!).catchError((e) {
      developer.log(e.toString());
      throw e;
    });
    final url = await imgUrl.ref.getDownloadURL();
    final result = await remote.uploadWisePaymentJson(
      token,
      UploadWisePayment(
        bookingId: bookingId,
        wiseEmail: email!,
        wiseAccountName: name!,
        imageProofTransfer: url.toString(),
      ),
    );
    // final result = await remote.uploadWisePayment(
    //   token,
    //   bookingId: bookingId,
    //   wiseEmail: email!,
    //   wiseAccountName: name!,
    //   imageProofTransfer: proofOfPayment!,
    // );
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
    developer.log("Submit", name: runtimeType.toString());

    final instance = FirebaseStorage.instance;
    String fileName = proofOfPayment!.path.split(Platform.pathSeparator).last;
    final instanceRef = instance.ref();
    final storageRef = instanceRef.child("payment/$bookingId/$fileName");
    final imgUrl = await storageRef.putFile(proofOfPayment!).catchError((e) {
      developer.log(e.toString());
      throw e;
    });
    final url = await imgUrl.ref.getDownloadURL();
    final result = await remote.uploadBankPaymentJson(
      token,
      UploadBankPayment(
        bookingId: bookingId,
        bankName: bankName!,
        bankAccountName: name!,
        imageProofTransfer: url.toString(),
      ),
    );
    return result.message;
  }
}
