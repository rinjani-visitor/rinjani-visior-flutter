import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rinjani_visitor/core/constant/network.dart';
import 'package:rinjani_visitor/features/order/data/models/response/order.dart';
import 'package:rinjani_visitor/features/order/data/models/response/update_payment.dart';
import 'package:rinjani_visitor/features/order/data/models/response/upload_payment.dart';

part "remote.g.dart";

@RestApi(baseUrl: restApiBaseUrl)
abstract class RemoteOrderSource {
  factory RemoteOrderSource(Dio dio, {String? baseUrl}) = _RemoteOrderSource;

  @PATCH("/api/payment")
  Future<UpdatePaymentResponse> setPaymentMethod(
    @Header("Authorization") String token,
    @Body() SetPaymentMethod body,
  );

  @MultiPart()
  @POST("/api/payment/bank")
  Future<UploadPaymentResponse> uploadBankPayment(
    @Header("Authorization") String token, {
    @Part(name: 'bookingId') required String bookingId,
    @Part(name: 'bankName') required String bankName,
    @Part(name: "bankAccountName") required String bankAccountName,
    @Part(name: "imageProofTransfer") required File imageProofTransfer,
  });

  @MultiPart()
  @POST("/api/payment/wise")
  Future<UploadPaymentResponse> uploadWisePayment(
    @Header("Authorization") String token, {
    @Part(name: "bookingId") required String bookingId,
    @Part(name: "wiseEmail") required String wiseEmail,
    @Part(name: "wiseAccountName") required String wiseAccountName,
    @Part(name: "imageProofTransfer") required File imageProofTransfer,
  });

  @GET("/api/order")
  Future<OrderResponse> getOrders(@Header("Authorization") String token);

  @PATCH("/api/order/{orderId}")
  Future<OrderResponse> cancelOrder(
    @Header("Authorization") String token,
    @Path("orderId") String orderId,
  );
}
