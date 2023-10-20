import 'package:rinjani_visitor/features/order/domain/order_model.dart';

abstract class OrderRepository {
  Future<void> sendPayment(OrderModel order);
}
