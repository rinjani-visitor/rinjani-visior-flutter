import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/presentation/widget/button/primary_button.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking_form.dart';
import 'package:rinjani_visitor/features/booking/presentation/view_model/booking_form.dart';
import 'package:rinjani_visitor/features/booking/presentation/view_model/booking_form_status.dart';

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
    return switch (bookingStatus) {
      AsyncData() => SuccessStatusPage(
          onNextPress: () => _backToHome(context),
        ),
      AsyncError(
        :final error,
      ) =>
        FailedStatusPage(
          onNextPress: () => _backToHome(context),
          errorReason: error.toString(),
        ),
      (_) => const CupertinoPageScaffold(
          child: Center(
            child: CupertinoActivityIndicator(),
          ),
        )
    };
  }
}

class SuccessStatusPage extends StatelessWidget {
  final void Function() onNextPress;

  const SuccessStatusPage({super.key, required this.onNextPress});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text("Booking success"),
      ),
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Your booking\nhas been requested",
              style: blackTextStyle.copyWith(fontSize: 32, fontWeight: bold),
              textAlign: TextAlign.center,
            ),
            Image.asset(
              'assets/booking-success.png',
              height: 255,
            ),
            Text(
              "We will inform you via email or notification later, once the transaction has been accepted",
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
                onPressed: onNextPress,
                child: const Text(
                  "back to Homepage",
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class FailedStatusPage extends StatelessWidget {
  final String errorReason;
  final void Function() onNextPress;

  const FailedStatusPage(
      {super.key, required this.onNextPress, required this.errorReason});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text("Booking failed"),
      ),
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Your booking has been failed to send",
              style: blackTextStyle.copyWith(fontSize: 32, fontWeight: bold),
              textAlign: TextAlign.center,
            ),
            Image.asset(
              'assets/booking-failed.png',
              height: 255,
            ),
            Text(
              "there is something wrong, with this error:\n$errorReason",
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
                onPressed: onNextPress,
                child: const Text(
                  "back to Homepage",
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
