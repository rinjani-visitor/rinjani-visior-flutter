import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/widget/button/primary_button.dart';

const bookingStatus = [
  {
    "title": "Booking success",
    "subtitle": "Your booking\nhas been requested",
    "description":
        "We will inform you via email or notification later, once the transaction has been accepted",
    "image": "assets/booking-success.png",
  },
  {
    "title": "Booking failed",
    "subtitle": "Your booking has been failed to send",
    "description": "there is something wrong,",
    "image": "assets/booking-failed.png",
  }
];

class BookingStatusPage extends StatelessWidget {
  BookingStatusPage({super.key});

  final data = bookingStatus[0];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text(data["title"] ?? ""),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data["subtitle"] ?? "",
                style: blackTextStyle.copyWith(fontSize: 32, fontWeight: bold),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                'assets/booking-success.png',
                height: 255,
              ),
              Text(
                data["description"] ?? "",
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
                        Navigator.popUntil(
                          context,
                          (route) => route.settings.name == "/home",
                        );
                      },
                      child: const Text(
                        "Home page",
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
