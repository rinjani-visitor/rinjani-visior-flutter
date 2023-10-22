import 'package:rinjani_visitor/features/order/domain/order_model.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_riverpod.g.dart';

@riverpod
class OrderRiverpod extends _$OrderRiverpod {
  late final ProductRespository _productRepository;

  @override
  OrderModel build() {
    _productRepository = ref.watch(productRepositoryProvider);
    return OrderModel(
        date: DateTime.timestamp().toIso8601String(),
        addOnId: <String>{},
        person: 0,
        time: <String>{});
  }

  void orderPackage(String packageId) {
    state.packageId = packageId;
  }

  void setDate(String date) {
    state.date = date;
  }

  void addTime(String time24H) {
    state.time.add(time24H);
  }

  void removeTime(String time24H) {
    state.time.remove(time24H);
  }

  String getTime() {
    final joinData = state.time.fold("Not provided", (_, e) => "$e,");
    return joinData;
  }

  void addAddons(String addOnId) {
    state.addOnId.add(addOnId);
  }

  void removeAddons(String addOnId) {
    state.addOnId.remove(addOnId);
  }
}
