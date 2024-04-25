import 'dart:io';
import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:rinjani_visitor/core/presentation/utils/image_parser.dart';
import 'package:rinjani_visitor/features/order/data/models/request/set_payment_method.dart';
import 'package:rinjani_visitor/features/order/data/models/request/upload_bank_payment.dart';
import 'package:rinjani_visitor/features/order/data/models/request/upload_wise_payment.dart';
import 'package:rinjani_visitor/features/order/data/source/remote.dart';
import 'package:rinjani_visitor/features/order/domain/entity/payment_method.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<String> _uploadPaymentAndGetUrl(String bookingId, File file) async {
  String fileName = file.path.split(Platform.pathSeparator).last;
  final instance = FirebaseStorage.instance;
  final instanceRef = instance.ref();
  final storageRef = instanceRef.child("payment/$bookingId/$fileName");
  final imgUrl = await storageRef.putFile(file).catchError((e) {
    developer.log(e.toString());
    throw e;
  });
  final url = await imgUrl.ref.getDownloadURL();
  return url;
}

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
      token,
      SetPaymentMethod(
        bookingId: bookingId,
        method: "Wise",
      ),
    );
    final compressedImage = await reduceImageByteSize(
      proofOfPayment!,
      targetSizeInKB: 5000,
    );

    final image = await compressedImage.readAsBytes();
    final tempFile = File("${compressedImage.path}temp.PNG");
    await tempFile.writeAsBytes(image);
    // final url = await _uploadPaymentAndGetUrl(bookingId, compressed);
    developer.log("IMG url: ${tempFile.path}", name: runtimeType.toString());

    final multipartFile = MultipartFile.fromBytes(
      await tempFile.readAsBytes(),
      filename: tempFile.path.split('/').last,
      contentType: MediaType("image", "png"),
    );

    final result = await remote.uploadWisePayment(token,
        bookingId: bookingId,
        wiseEmail: email ?? "",
        wiseAccountName: name ?? "",
        imageProofTransfer: [multipartFile]);

    // final result = await remote.uploadWisePaymentJson(
    //   token,
    //   UploadWisePayment(
    //     bookingId: bookingId,
    //     wiseEmail: email!,
    //     wiseAccountName: name!,
    //     imageProofTransfer: url.toString(),
    //   ),
    // );

    return result.message;
  }
}

class BankPaymentMethod implements PaymentMethod {
  @override
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
      token,
      SetPaymentMethod(
        bookingId: bookingId,
        method: "Bank",
      ),
    );

    developer.log("Submit", name: runtimeType.toString());
    final compressedImage = await reduceImageByteSize(
      proofOfPayment!,
      targetSizeInKB: 5000,
    );

    final image = await compressedImage.readAsBytes();
    final tempFile = File("${compressedImage.path}temp.PNG");
    await tempFile.writeAsBytes(image);
    developer.log("file path: ${tempFile.path}", name: runtimeType.toString());

    final multipartFile = MultipartFile.fromBytes(
      await tempFile.readAsBytes(),
      filename: tempFile.path.split('/').last,
      contentType: MediaType("image", "png"),
    );

    final result = await remote.uploadBankPayment(
      token,
      bookingId: bookingId,
      bankName: bankName ?? "",
      bankAccountName: name ?? "",
      imageProofTransfer: [multipartFile],
    );

    // final url = await _uploadPaymentAndGetUrl(bookingId, compressed);
    // final result = await remote.uploadBankPaymentJson(
    //   token,
    //   UploadBankPayment(
    //     bookingId: bookingId,
    //     bankName: bankName!,
    //     bankAccountName: name!,
    //     imageProofTransfer: url.toString(),
    //   ),
    // );
    return result.message;
  }
}
