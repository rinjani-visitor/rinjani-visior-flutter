import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:rinjani_visitor/core/exception/exception.dart';
import 'package:rinjani_visitor/core/presentation/utils/image_parser.dart';
import 'package:rinjani_visitor/features/order/domain/entity/order.dart';
import 'package:rinjani_visitor/features/order/domain/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  @override
  Future<void> cancelOrder(OrderEntity order) {
    // TODO: implement cancelOrder
    throw UnimplementedError();
  }

  @override
  Future<void> choosePaymentMethod(OrderEntity order) {
    // TODO: implement choosePaymentMethod
    throw UnimplementedError();
  }

  @override
  Future<void> sendOrder(OrderEntity order) {
    // TODO: implement sendOrder
    throw UnimplementedError();
  }

  @override
  Future<void> sendProofOfPayment(File proofOfPayment) async {
    try {
      final compressedImg =
          await reduceImageByteSize(proofOfPayment, targetSizeInKB: 5000);
      final _ = MultipartFile.fromBytes(compressedImg.readAsBytesSync(),
          contentType: MediaType('image', proofOfPayment.path.split('.').last),
          filename: "proof_of_payment.jpg");
      //TODO: send data to remote
    } on Exception catch (e) {
      throw ExtException.fromDioException(e);
    }
  }
}
