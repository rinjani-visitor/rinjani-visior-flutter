import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/file_picker_widget.dart';

class ContinuePaymentPage extends StatelessWidget {
  const ContinuePaymentPage({Key? key}) : super(key: key);

  Widget header() {
    return Center(
      child: Column(
        children: [
          Text(
            "Please complete your payment",
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Image.asset(
                'assets/wise-logo.png',
                width: 196,
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Amount to pay',
                    style: blackTextStyle.copyWith(fontSize: 16),
                  ),
                  Text(
                    'Rp.400.000',
                    style:
                        blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('No Rekening'),
                  Text(
                    '028393928339238',
                    style: blackTextStyle.copyWith(fontWeight: bold),
                  )
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('A/N'),
                  Text(
                    'Rinjani Visitor',
                    style: blackTextStyle.copyWith(fontWeight: bold),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upload proof of transfer',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
            ),
            SizedBox(
              height: 16,
            ),
            FilePickerWidget()
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: CupertinoNavigationBar(
          middle: Text('Complete your payment'),
          automaticallyImplyLeading: false,
        ),
        child: SafeArea(
          child: Container(
              margin: EdgeInsets.only(top: 24, left: 16, right: 16),
              child: Column(
                children: [
                  header(),
                  SizedBox(
                    height: 64,
                  ),
                  body()
                ],
              )),
        ));
  }
}
