import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/button/primary_button.dart';

const bookingStatus = [
  {
    "title": "Booking success",
    "description":
        "Your booking has been recieved, we will inform you via email or notification later, once the transaction has been accepted",
    "image": "assets/booking-success.png",
  },
  {
    "title": "Booking failed",
    "description": "Your booking has been failed, or there is something wrong.",
    "image": "assets/booking-failed.png",
  }
];

class BookingStatusPage extends StatelessWidget {
  const BookingStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text('Booking success'),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your booking\nhas been recieved',
                style: blackTextStyle.copyWith(fontSize: 32, fontWeight: bold),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                'assets/booking-success.png',
                height: 255,
              ),
              Text(
                'we will inform you via email or notification later, once the transaction has been accepted',
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
                        Navigator.popAndPushNamed(context, '/home');
                      },
                      child: Text(
                        "Home page",
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
