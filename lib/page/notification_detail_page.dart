import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';

enum ButtonStatus { success, declined, offering, waiting, review }

class NotificationDetailPage extends StatelessWidget {
  //variabel buat atus status
  final ButtonStatus statusNotif;

  const NotificationDetailPage({Key? key, required this.statusNotif}) : super(key: key);

  Widget imageContainer() {
    return Container(
      width: double.infinity,
      height: 218,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(smallRadius)),
    );
  }

  Widget StatusLabel() {
    //fungsi untuk menentukan warna pada widget status berdasarkan enum
    Color getColor(ButtonStatus statusColor) {
      switch (statusColor) {
        case ButtonStatus.declined:
          return errorRed;
        case ButtonStatus.offering:
          return infoBlue;
        case ButtonStatus.success:
          return successGreen;
        case ButtonStatus.waiting:
          return warningYellow;
        case ButtonStatus.review:
          return statusBrown;
        default:
          return infoBlue;
      }
    }

    //fungsi untuk menentukan teks pada status
    String getStatus(ButtonStatus statusInfo) {
      switch (statusInfo) {
        case ButtonStatus.declined:
          return 'Declined';
        case ButtonStatus.offering:
          return 'Offering';
        case ButtonStatus.success:
          return 'Success';
        case ButtonStatus.waiting:
          return 'Waiting';
        case ButtonStatus.review:
          return 'Reviewing';

        default:
          return 'offering';
      }
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(smallRadius),

          //ubah warna status berdasarkan kondisinya
          color: getColor(statusNotif)),
      child: Text(
        //ubah teks pada status berdasarkan kondisinya
        getStatus(statusNotif),
        style: whiteTextStyle.copyWith(fontSize: 12, fontWeight: regular),
      ),
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
        StatusLabel()
      ],
    );
  }

  Widget information() {
    //switch buat atur teks nya berdasarkan status
    Text statusText(ButtonStatus textStatus) {
      switch (textStatus) {
        case ButtonStatus.declined:
          return Text(
            'Your offer has been declined by admin, you can make another offer to admin or make another booking.',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          );
        case ButtonStatus.success:
          return Text(
            'Your payment has been recieved and we will send you the trip detail through email. Thank you.',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          );
        case ButtonStatus.waiting:
          return Text(
            'Your offer has been approved by admin and please complete your payment to complete this booking.',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          );
        case ButtonStatus.offering:
          return Text(
            'Your offer has been sent to the admin, please wait untill admin approve your offer',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          );
        case ButtonStatus.review:
          return Text(
            'Your payment has been sent to the admin, please wait untill admin approve your payment',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          );
        default:
          return Text('');
      }
    }

    return Column(
      //set status text nya di sini
      children: [statusText(statusNotif)],
    );
  }

  Widget declinedBottom() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(smallRadius)),
          child: TextButton(
              onPressed: () {},
              child: Text(
                'Make another offer',
                style:
                    whiteTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
              )),
        ),
        SizedBox(
          height: 8,
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              'Cancel this booking',
              style: redTextStyle.copyWith(
                  fontSize: 12, decoration: TextDecoration.underline),
            ))
      ],
    );
  }

  Widget waitingButton() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(smallRadius)),
          child: TextButton(
              onPressed: () {},
              child: Text(
                'Continue for payment',
                style:
                    whiteTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
              )),
        ),
        SizedBox(
          height: 8,
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              'Cancel this booking',
              style: redTextStyle.copyWith(
                  fontSize: 12, decoration: TextDecoration.underline),
            ))
      ],
    );
  }

  Widget succesAndReviewing() {
    return Container();
  }

  Widget offeringButton() {
    return TextButton(
        onPressed: () {},
        child: Text(
          'Cancel this booking',
          style: redTextStyle.copyWith(
              fontSize: 12, decoration: TextDecoration.underline),
        ));
  }

  @override
  Widget build(BuildContext context) {
    //switch case buat atur button berdasarkan statusnya
    Widget getButton(ButtonStatus buttonStatus) {
      switch (buttonStatus) {
        case ButtonStatus.declined:
          return declinedBottom();
        case ButtonStatus.offering:
          return offeringButton();
        case ButtonStatus.waiting:
          return waitingButton();
        case ButtonStatus.review:
          return succesAndReviewing();
        case ButtonStatus.success:
          return succesAndReviewing();

        default:
          return succesAndReviewing();
      }
    }

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
                information(),
                Spacer(),
                getButton(statusNotif)
              ],
            ),
          ),
        ));
  }
}
