import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/status.dart';

class NotificationDetailPage extends StatelessWidget {
  const NotificationDetailPage({Key? key}) : super(key: key);

  Widget imageContainer() {
    return Container(
      width: double.infinity,
      height: 218,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(smallRadius)),
    );
  }

  Widget header() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rinjani Trip',
              style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
            ),
            Text(
              'Order Booking No: JBEU183382B',
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            Text(
              'Order date: 12 - 08 - 2023',
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
          ],
        ),
        const Spacer(),
        Status(status: StatusColor.offering,)
      ],
    );
  }

  Widget information() {
    return Text(
      'Your payment has been recieved and we will send you the trip detail through email. Thank you.',
      style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: const CupertinoNavigationBar(
          previousPageTitle: 'Back',
          middle: Text('Payment Status'),
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              children: [
                imageContainer(),
                const SizedBox(
                  height: 24,
                ),
                header(),
                const SizedBox(
                  height: 24,
                ),
                information()
              ],
            ),
          ),
        ));
  }
}
