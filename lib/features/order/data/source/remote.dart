import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:retrofit/http.dart';
import 'package:rinjani_visitor/core/constant/network.dart';
import 'package:rinjani_visitor/features/order/data/models/response/booking.dart';
import 'package:rinjani_visitor/features/order/data/models/response/order.dart';

part "remote.g.dart";

@RestApi(baseUrl: restApiBaseUrl)
abstract class RemoteOrderSource {
  factory RemoteOrderSource(Dio dio, {String? baseUrl}) = _RemoteOrderSource;

  @MultiPart()
  @POST("/api/payment/bank")
  Future<BookingResponse> uploadBankPayment(
    @Header("Authorization") String token, {
    @Part() required String bookingId,
    @Part() required String bankName,
    @Part() required String bankAccountName,
    @Part() required String bankAccountNumber,
    @Part(name: "imageProofTransfer", contentType: "image/jpg")
    required File imageProofTransfer,
  });

  @MultiPart()
  @POST("/api/payment/wise")
  Future<BookingResponse> uploadWisePayment(
    @Header("Authorization") String token, {
    @Part(name: "bookingId") required String bookingId,
    @Part(name: "wiseEmail") required String wiseEmail,
    @Part(name: "wiseAccountName") required String wiseAccountName,
    @Part(name: "imageProofTransfer", contentType: "image/jpg")
    required File imageProofTransfer,
  });

  @GET("/api/order")
  Future<OrderResponse> getOrders(@Header("Authorization") String token);

  @PATCH("/api/order/{orderId}")
  Future<OrderResponse> cancelOrder(
    @Header("Authorization") String token,
    @Path("orderId") String orderId,
  );
}
