import 'dart:io';

import 'package:rinjani_visitor/features/order/domain/order_model.dart';

/// Repository to manage order data like send order, cancel order, choose payment method, and send proof of payment.
abstract class OrderRepository {
  Future<void> sendOrder(OrderModel order);
  Future<void> cancelOrder(OrderModel order);

  Future<void> choosePaymentMethod(OrderModel order);
  Future<void> sendProofOfPayment(File proofOfPayment);
}
