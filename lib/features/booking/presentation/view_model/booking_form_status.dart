import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/booking/data/repo.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking_form.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking_form_status.dart';

final bookingFormStatusProvider =
    FutureProvider.family<BookingFormStatus, BookingFormEntity>(
        (ref, data) async {
  final token = ref
      .read(authViewModelProvider)
      .asData!
      .value!
      .toAccessTokenAuthorization();
  final userId = ref.read(authViewModelProvider).asData!.value!.userId!;
  developer.log("token $token", name: "bookingFormStatusProvider");
  final result = await ref
      .read(bookingRepositoryProvider)
      .createBooking(token, userId, data);
  return result;
});
