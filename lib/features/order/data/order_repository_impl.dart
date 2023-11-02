import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:rinjani_visitor/core/utils/exception_utils.dart';
import 'package:rinjani_visitor/core/utils/image_parser.dart';
import 'package:rinjani_visitor/features/order/domain/order_model.dart';
import 'package:rinjani_visitor/features/order/domain/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  @override
  Future<void> cancelOrder(OrderModel order) {
    // TODO: implement cancelOrder
    throw UnimplementedError();
  }

  @override
  Future<void> choosePaymentMethod(OrderModel order) {
    // TODO: implement choosePaymentMethod
    throw UnimplementedError();
  }

  @override
  Future<void> sendOrder(OrderModel order) {
    // TODO: implement sendOrder
    throw UnimplementedError();
  }

  @override
  Future<void> sendProofOfPayment(File proofOfPayment) async {
    try {
      final compressedImg =
          await reduceImageByteSize(proofOfPayment, targetSizeInKB: 5000);
      final partImg = MultipartFile.fromBytes(compressedImg.readAsBytesSync(),
          contentType: MediaType('image', proofOfPayment.path.split('.').last),
          filename: "proof_of_payment.jpg");
      //TODO: send data to remote
    } on Exception catch (e) {
      exceptionHandler(e);
    }
  }
}
