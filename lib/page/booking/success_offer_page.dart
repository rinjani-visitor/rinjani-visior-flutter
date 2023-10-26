import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class SuccessOfferPage extends StatelessWidget {
  const SuccessOfferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
            child: Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 24),
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Succes to make\nnew offer',
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
          TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/home');
              },
              child: Container(
                height: 43,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(smallRadius)),
                child: Center(
                    child: Text(
                  'Return to home page',
                  style: whiteTextStyle.copyWith(
                      fontSize: textButton2, fontWeight: semibold),
                )),
              )),
        ],
      ),
    )));
  }
}
