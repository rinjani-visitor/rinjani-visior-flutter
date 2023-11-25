import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/order/domain/entity/order.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';
import 'package:rinjani_visitor/features/product/domain/product_repository.dart';

final orderViewModelProvider =
    AutoDisposeNotifierProvider<OrderRiverpod, OrderEntity>(
        () => OrderRiverpod());

class OrderRiverpod extends AutoDisposeNotifier<OrderEntity> {
  // ignore: unused_field
  late final ProductRespository _productRepository;

  @override
  OrderEntity build() {
    _productRepository = ref.watch(productRepositoryProvider);
    return OrderEntity(
        date: DateTime.timestamp().toIso8601String(),
        addOn: <String>{},
        person: 0,
        time: <String>{});
  }

  void reset() {
    state = OrderEntity(
        date: DateTime.timestamp().toIso8601String(),
        addOn: <String>{},
        person: 0,
        time: <String>{});
  }

  void orderPackage(String packageId) {
    state.packageId = packageId;
  }

  void setDate(String? date) {
    if (date == null) {
      return;
    }
    debugPrint("OrderRiverpod: $date");
    state.date = date;
  }

  DateTime getDate() {
    final parsedDate = DateTime.parse(state.date);
    debugPrint("OrderRiverpod: $parsedDate");
    return DateTime.parse(state.date);
  }

  void addTime(String time24H) {
    state.time.add(time24H);
  }

  void removeTime(String time24H) {
    state.time.remove(time24H);
  }

  String getTimeInStringFormat() {
    final joinData = state.time.isNotEmpty
        ? state.time.join(", ")
        : "Time arrival is not set";
    debugPrint(state.time.toString());
    debugPrint(joinData);
    return joinData;
  }

  void addAddon(String name) {
    state.addOn.add(name);
    debugPrint("Addon: ${state.addOn.length}");
  }

  void removeAddon(String name) {
    debugPrint("remove addon");
    state.addOn.removeWhere((element) => element == name);
    debugPrint("Addon: ${state.addOn.length}");
  }

  void submitOrder(BuildContext context, ProductDetailEntity data) {
    state.product = data;
    Navigator.pushNamed(context, "/booking/detail");
  }
}
