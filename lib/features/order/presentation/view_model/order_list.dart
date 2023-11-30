import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/order/data/repository_impl.dart';
import 'package:rinjani_visitor/features/order/domain/entity/order.dart';
import 'package:rinjani_visitor/features/order/domain/order_repository.dart';

final orderListViewModelProvider =
    AutoDisposeAsyncNotifierProvider<OrderListViewModel, List<OrderEntity>>(
        OrderListViewModel.new);

class OrderListViewModel extends AutoDisposeAsyncNotifier<List<OrderEntity>> {
  OrderRepository get _orderRepository => ref.read(orderRepositoryProvider);
  AuthViewModel get _authViewModel => ref.read(authViewModelProvider.notifier);
  @override
  FutureOr<List<OrderEntity>> build() {
    return _orderRepository.getOrders(_authViewModel.getAccessToken()!);
  }
}
