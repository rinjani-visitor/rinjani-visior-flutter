import 'dart:io';

import 'package:rinjani_visitor/features/order/data/models/response/upload_payment.dart';
import 'package:rinjani_visitor/features/order/domain/entity/order_form.dart';

/// Repository to manage order data like send order, cancel order, choose payment method, and send proof of payment.
abstract class OrderRepository {
  Future<String?> sendOrder(String token, OrderFormEntity order);
  Future<void> cancelOrder(String token, OrderFormEntity order);
}
