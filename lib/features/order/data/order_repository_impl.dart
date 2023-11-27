import 'dart:io';
import 'dart:developer' as developer;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/exception/exception.dart';
import 'package:rinjani_visitor/core/presentation/services/dio_service.dart';
import 'package:rinjani_visitor/features/booking/data/source/remote.dart';
import 'package:rinjani_visitor/features/order/data/models/request/set_payment_method.dart';
import 'package:rinjani_visitor/features/order/data/models/response/upload_payment.dart';
import 'package:rinjani_visitor/features/order/data/source/remote.dart';
import 'package:rinjani_visitor/features/order/domain/entity/order_form.dart';
import 'package:rinjani_visitor/features/order/domain/entity/payment_method.dart';
import 'package:rinjani_visitor/features/order/domain/order_repository.dart';

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  return OrderRepositoryImpl(RemoteOrderSource(ref.read(dioServiceProvider)));
});

class OrderRepositoryImpl implements OrderRepository {
  RemoteOrderSource remote;
  OrderRepositoryImpl(this.remote);
  @override
  Future<void> cancelOrder(String token, OrderFormEntity order) {
    // TODO: implement cancelOrder
    throw UnimplementedError();
  }

  @override
  Future<String?> sendOrder(String token, OrderFormEntity order) async {
    final payment = order.paymentMethod;
    try {
      switch (payment.runtimeType) {
        case WisePaymentMethod:
          final paymentWise = payment as WisePaymentMethod;
          developer.log("update to wise payment");
          await remote.setPaymentMethod(token,
              SetPaymentMethod(bookingId: payment.bookingId, method: "Wise"));
          developer.log("uploading wise payment");
          developer.log("booking id ${payment.bookingId}");
          developer.log("email ${payment.email}");
          developer.log("name ${payment.name}");
          developer.log("file ${payment.proofOfPayment?.path}");
          final result = await remote.uploadWisePayment(token,
              bookingId: payment.bookingId,
              wiseEmail: payment.email!,
              wiseAccountName: payment.name!,
              imageProofTransfer: payment.proofOfPayment!);
          return result.message;
        case BankPaymentMethod:
          final paymentBank = payment as BankPaymentMethod;
          developer.log("update to bank payment");
          await remote.setPaymentMethod(token,
              SetPaymentMethod(bookingId: payment.bookingId, method: "Bank"));
          developer.log("uploading bank payment");
          developer.log("booking id ${payment.bookingId}");
          developer.log("bank name ${payment.bankName}");
          developer.log("name ${payment.name}");
          developer.log("file ${payment.proofOfPayment?.path}");
          final result = await remote.uploadBankPayment(
            token,
            bookingId: payment.bookingId,
            bankName: payment.bankName!,
            bankAccountName: payment.name!,
            imageProofTransfer: payment.proofOfPayment!,
          );
          return result.message;
      }
    } catch (e) {
      throw ExtException.fromDioException(e);
    }
  }
}
