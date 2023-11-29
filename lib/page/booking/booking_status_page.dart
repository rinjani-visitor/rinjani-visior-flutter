import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/widget/button/primary_button.dart';
import 'package:rinjani_visitor/features/booking/data/repository_impl.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking_form.dart';
import 'package:rinjani_visitor/features/booking/presentation/view_model/booking_form.dart';
import 'package:rinjani_visitor/features/booking/presentation/view_model/booking_form_status.dart';

const textSuccess = {
  "title": "Booking success",
  "subtitle": "Your booking\nhas been requested",
  "description":
      "We will inform you via email or notification later, once the transaction has been accepted",
  "image": "assets/booking-success.png",
};

const textFailed = {
  "title": "Booking failed",
  "subtitle": "Your booking has been failed to send",
  "description": "there is something wrong,",
  "image": "assets/booking-failed.png",
};

class BookingStatusPage extends ConsumerStatefulWidget {
  const BookingStatusPage({super.key});

  @override
  ConsumerState<BookingStatusPage> createState() => _BookingStatusPageState();
}

class _BookingStatusPageState extends ConsumerState<BookingStatusPage> {
  void _backToHome(BuildContext context) {
    Navigator.popUntil(
      context,
      ModalRoute.withName("/home"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final BookingFormEntity bookingForm =
        ref.read(bookingFormViewModelProvider);
    final bookingStatus = ref.watch(bookingFormStatusProvider(bookingForm));
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text(textSuccess["title"] ?? ""),
      ),
      child: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: switch (bookingStatus) {
              AsyncData(:final value) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      textSuccess["subtitle"] ?? "",
                      style: blackTextStyle.copyWith(
                          fontSize: 32, fontWeight: bold),
                      textAlign: TextAlign.center,
                    ),
                    Image.asset(
                      'assets/booking-success.png',
                      height: 255,
                    ),
                    Text(
                      textSuccess["description"] ?? "",
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(smallRadius)),
                        child: PrimaryButton(
                            onPressed: () {
                              _backToHome(context);
                            },
                            child: const Text(
                              "back to Homepage",
                            )))
                  ],
                ),
              AsyncError(:final error, :final stackTrace) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      textFailed["subtitle"] ?? "",
                      style: blackTextStyle.copyWith(
                          fontSize: 32, fontWeight: bold),
                      textAlign: TextAlign.center,
                    ),
                    Image.asset(
                      'assets/booking-failed.png',
                      height: 255,
                    ),
                    Text(
                      error.toString(),
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(smallRadius)),
                        child: PrimaryButton(
                            onPressed: () {
                              _backToHome(context);
                            },
                            child: const Text(
                              "back to Homepage",
                            )))
                  ],
                ),
              _ => Center(child: const CupertinoActivityIndicator()),
            }),
      ),
    );
  }
}
