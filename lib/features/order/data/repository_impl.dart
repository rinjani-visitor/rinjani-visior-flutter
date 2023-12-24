import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/services/dio_service.dart';
import 'package:rinjani_visitor/features/order/data/source/remote.dart';
import 'package:rinjani_visitor/features/order/domain/entity/order.dart';
import 'package:rinjani_visitor/features/order/domain/entity/order_form.dart';
import 'package:rinjani_visitor/features/order/domain/order_repository.dart';

import 'adapter/payment.dart';

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  return OrderRepositoryImpl(RemoteOrderSource(ref.read(dioServiceProvider)));
});

class OrderRepositoryImpl implements OrderRepository {
  RemoteOrderSource remote;

  OrderRepositoryImpl(this.remote);

  @override
  Future<String?> sendOrder(String token, OrderFormEntity order) async {
    final payment = order.paymentMethod;
    final result = await payment?.submit(remote, token);
    return result;
  }

  @override
  Future<List<OrderEntity>> getOrders(String token) async {
    final result = await remote.getOrders(token);
    final entities = result.data?.map((e) => e.toEntity()).toList();
    return entities ?? [];
  }
}
