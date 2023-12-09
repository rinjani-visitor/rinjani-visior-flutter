import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';
import 'package:rinjani_visitor/features/booking/presentation/view_model/booking_list.dart';
import 'package:rinjani_visitor/features/order/data/repository_impl.dart';
import 'package:rinjani_visitor/features/order/domain/entity/order_form.dart';
import 'package:rinjani_visitor/features/order/domain/entity/payment_method.dart';
import 'package:rinjani_visitor/features/order/domain/order_repository.dart';

final orderPaymentViewModelProvider =
    NotifierProvider<OrderPaymentViewModel, OrderFormEntity>(
        OrderPaymentViewModel.new);

class OrderPaymentViewModel extends Notifier<OrderFormEntity> {
  OrderRepository get _orderRepository => ref.read(orderRepositoryProvider);

  AuthViewModel get _authData => ref.read(authViewModelProvider.notifier);

  @override
  OrderFormEntity build() {
    return OrderFormEntity();
  }

  void setBookingId(BookingDetailEntity booking) async {
    state.bookingDetail = booking;
  }

  void addPaymentMethod(PaymentMethod paymentMethod) {
    state = OrderFormEntity(paymentMethod: paymentMethod);
  }

  /// Function that insert all data from payment method form to designated class.
  ///
  ///
  /// [paymentMethod] should be set first before run this function
  void finalizePaymentMethod(String field1, String field2, File? file) {
    final temp = state;
    temp.paymentMethod?.fillData(
      field1: field1,
      field2: field2,
      file: file,
    );
    state = temp;
  }

  /// initiate and send payment to Rinjani Visitor API
  void sendPayment(
      void Function() onSuccess, void Function(String message) onError) async {
    final token = _authData.getAccessToken()!;
    try {
      await _orderRepository.sendOrder(token, state);
      Fluttertoast.showToast(msg: "Payment success");
      final _ = ref.refresh(bookingListViewModelProvider);
      onSuccess();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      onError(e.toString());
    }
  }
}
