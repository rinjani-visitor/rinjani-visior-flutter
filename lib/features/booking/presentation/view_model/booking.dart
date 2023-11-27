import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/utils/internationalization.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking_form.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';
import 'package:rinjani_visitor/features/product/domain/product_repository.dart';

final bookingViewModelProvider =
    AutoDisposeNotifierProvider<BookingViewModel, BookingFormEntity>(
        () => BookingViewModel());

class BookingViewModel extends AutoDisposeNotifier<BookingFormEntity> {
  // ignore: unused_field
  late final ProductRespository _productRepository;

  @override
  BookingFormEntity build() {
    _productRepository = ref.watch(productRepositoryProvider);
    return BookingFormEntity(
      addOns: [],
      startDateTime: DateTime.now(),
      productId: "",
      totalPersons: "",
      userId: "",
    );
  }

  void reset() {
    state = BookingFormEntity(
      addOns: [],
      startDateTime: DateTime.now(),
      productId: "",
      totalPersons: "",
      userId: "",
    );
  }

  void orderPackage(String packageId) {
    state.productId = packageId;
  }

  void setDate(DateTime? date) {
    if (date == null) {
      return;
    }
    debugPrint("OrderRiverpod: $date");
    state.startDateTime = date;
  }

  DateTime getDate() {
    return state.startDateTime;
  }

  String getLocalizedDate() {
    if (state.endDateTime == null) {
      return dateFormat.format(state.startDateTime);
    }
    return "${dateFormat.format(state.startDateTime)} - ${dateFormat.format(state.endDateTime!)}";
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

  void toggleAddon(String name) {
    if (state.addOns.contains(name)) {
      removeAddon(name);
    } else {
      addAddon(name);
    }
  }

  void submitOrder(BuildContext context, ProductDetailEntity data) {
    state.product = data;
    Navigator.pushNamed(context, "/booking/detail");
  }
}
