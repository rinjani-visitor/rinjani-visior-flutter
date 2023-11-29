import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/utils/internationalization.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/booking/data/repo.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking_form.dart';
import 'package:rinjani_visitor/features/booking/domain/repository/booking.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

final bookingFormViewModelProvider =
    AutoDisposeNotifierProvider<BookingFormViewModel, BookingFormEntity>(
  BookingFormViewModel.new,
);

class BookingFormViewModel extends AutoDisposeNotifier<BookingFormEntity> {
  BookingRepository get bookingRepository => ref.read(
        bookingRepositoryProvider,
      );

  AuthViewModel get authData => ref.read(authViewModelProvider.notifier);

  @override
  BookingFormEntity build() {
    return BookingFormEntity(
      addOns: [],
      startDateTime: DateTime.now(),
      productId: "",
      totalPersons: "",
      userId: "",
    );
  }

  void setupEditBooking(String bookingId) async {
    final token = authData.getAccessToken();
    final bookingDetail =
        await bookingRepository.getBookingDetail(token!, bookingId);
    final form = BookingFormEntity(
      userId: bookingDetail.userId,
      productId: bookingDetail.productId,
      startDateTime: bookingDetail.startDateTime ?? DateTime.now(),
      addOns: bookingDetail.addOns?.split(",") ?? [],
      totalPersons: bookingDetail.totalPersons.toString(),
    );
    state = form;
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

  void finalizeBooking(BuildContext context, ProductDetailEntity data) async {
    state.product = data;

    // return result
  }
}
