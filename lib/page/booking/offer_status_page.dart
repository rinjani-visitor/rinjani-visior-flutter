import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/button/primary_button.dart';

const bookingStatus = [
  {
    "title": "Offering success",
    "description":
        "Your offering has been requested, please wait for the admin to accept your offer.",
    "image": "assets/booking-success.png",
  },
  {
    "title": "Offering failed ",
    "description":
        "Your offering has been failed, or there is something wrong.",
    "image": "assets/booking-failed.png",
  }
];

class OfferStatusPage extends StatelessWidget {
  const OfferStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
            child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 24),
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Offering Success',
                  style: blackTextStyle.copyWith(
                    fontSize: heading3,
                    fontWeight: bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Image.asset(
                  'assets/booking-success.png',
                  width: 300,
                  fit: BoxFit.fill,
                ),
                Text(
                  'Your offer has been sent to the admin, we will inform you if the admin already accept your offer.',
                  style: blackTextStyle.copyWith(
                      fontSize: body1, fontWeight: medium),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Spacer(),
          PrimaryButton(
              onPressed: () {},
              child: Text(
                'Return to home page',
                style: whiteTextStyle.copyWith(
                    fontSize: textButton2, fontWeight: semibold),
              )),
        ],
      ),
    )));
  }
}
