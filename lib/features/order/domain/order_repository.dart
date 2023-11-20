import 'dart:io';

import 'package:rinjani_visitor/features/order/domain/entity/order.dart';

/// Repository to manage order data like send order, cancel order, choose payment method, and send proof of payment.
abstract class OrderRepository {
  Future<void> sendOrder(OrderEntity order);
  Future<void> cancelOrder(OrderEntity order);

  Future<void> choosePaymentMethod(OrderEntity order);
  Future<void> sendProofOfPayment(File proofOfPayment);
}
