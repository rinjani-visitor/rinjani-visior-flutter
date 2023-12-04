import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';
import 'package:rinjani_visitor/features/order/data/repository_impl.dart';
import 'package:rinjani_visitor/features/order/domain/entity/order_form.dart';
import 'package:rinjani_visitor/features/order/domain/entity/payment_method.dart';
import 'package:rinjani_visitor/features/order/domain/order_repository.dart';

final orderPaymentViewModelProvider =
    NotifierProvider<OrderPaymentViewModel, OrderFormEntity>(
        OrderPaymentViewModel.new);

class OrderPaymentViewModel extends Notifier<OrderFormEntity> {
  OrderRepository get _orderRepository => ref.read(orderRepositoryProvider);

  @override
  OrderFormEntity build() {
    return OrderFormEntity();
  }

  void setBookingId(BookingDetailEntity booking) async {
    state.bookingDetail = booking;
  }

  void addWisePaymentMethod(WisePaymentMethod paymentMethod) {
    state.paymentMethod = paymentMethod;
  }

  void addBankPaymentMethod(BankPaymentMethod paymentMethod) {
    developer.log("${state.bookingDetail?.bookingId}",
        name: runtimeType.toString());
    state = OrderFormEntity(paymentMethod: paymentMethod);
  }

  /// Function that insert all data from payment method form to designated class.
  ///
  ///
  /// [paymentMethod] should be set first before run this function
  void finalizePaymentMethod(String field1, String field2, File? file) {
    final temp = state;
    if (temp.paymentMethod is WisePaymentMethod) {
      final wisePaymentMethod = temp.paymentMethod as WisePaymentMethod;
      wisePaymentMethod.email = field1;
      wisePaymentMethod.name = field2;
      wisePaymentMethod.proofOfPayment = file;
      temp.paymentMethod = wisePaymentMethod;
    }
    if (temp.paymentMethod is BankPaymentMethod) {
      final bankPaymentMethod = temp.paymentMethod as BankPaymentMethod;
      bankPaymentMethod.bankName = field1;
      bankPaymentMethod.name = field2;
      bankPaymentMethod.proofOfPayment = file;
      temp.paymentMethod = bankPaymentMethod;
    }
    state = temp;
  }

  void sendOrder(
      void Function() onSuccess, void Function(String message) onError) async {
    final token =
        ref.read(authViewModelProvider).value!.toAccessTokenAuthorization();
    try {
      await _orderRepository.sendOrder(token, state);
      Fluttertoast.showToast(msg: "Payment success");
      onSuccess();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      onError(e.toString());
    }
  }
}
