import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';
import 'package:rinjani_visitor/features/product/domain/product_repository.dart';

final bookingViewModelProvider =
    AutoDisposeNotifierProvider<BookingViewModel, BookingEntity>(
        () => BookingViewModel());

class BookingViewModel extends AutoDisposeNotifier<BookingEntity> {
  // ignore: unused_field
  late final ProductRespository _productRepository;

  @override
  BookingEntity build() {
    _productRepository = ref.watch(productRepositoryProvider);
    return BookingEntity(
      addOns: [],
      startDateTime: DateTime.timestamp().toIso8601String(),
      endDateTime: DateTime.timestamp().toIso8601String(),
      offeringPrice: 0,
      productId: "",
      totalPersons: "",
      userId: "",
    );
  }

  void reset() {
    state = BookingEntity(
      addOns: [],
      startDateTime: DateTime.timestamp().toIso8601String(),
      endDateTime: DateTime.timestamp().toIso8601String(),
      offeringPrice: 0,
      productId: "",
      totalPersons: "",
      userId: "",
    );
  }

  void orderPackage(String packageId) {
    state.productId = packageId;
  }

  void setDate(String? date) {
    if (date == null) {
      return;
    }
    debugPrint("OrderRiverpod: $date");
    state.startDateTime = date;
  }

  DateTime getDate() {
    final parsedDate = DateTime.parse(state.startDateTime);
    debugPrint("OrderRiverpod: $parsedDate");
    return DateTime.parse(state.startDateTime);
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
    state.addOns.add(name);
    debugPrint("Addon: ${state.addOns.length}");
  }

  void removeAddon(String name) {
    debugPrint("remove addon");
    state.addOns.removeWhere((element) => element == name);
    debugPrint("Addon: ${state.addOns.length}");
  }

  void submitOrder(BuildContext context, ProductDetailEntity data) {
    state.product = data;
    Navigator.pushNamed(context, "/booking/detail");
  }
}
