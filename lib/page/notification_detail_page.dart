import 'package:intl/intl.dart' as intl;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/enumerate/booking_enum.dart';
import 'package:rinjani_visitor/core/theme/theme.dart';
import 'package:rinjani_visitor/widget/cancel_button_widget.dart';

class NotificationDetailPage extends StatelessWidget {
  //variabel buat atus status
  final BookingStatus statusNotif;

  const NotificationDetailPage({super.key, required this.statusNotif});

  Widget imageContainer() {
    return Container(
      width: double.infinity,
      height: 218,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(smallRadius)),
    );
  }

  Widget statusLabel() {
    //fungsi untuk menentukan warna pada widget status berdasarkan enum
    Color getColor(BookingStatus statusColor) {
      switch (statusColor) {
        case BookingStatus.declined:
          return errorRed;
        case BookingStatus.offering:
          return infoBlue;
        case BookingStatus.success:
          return successGreen;
        case BookingStatus.waiting:
          return warningYellow;
        case BookingStatus.review:
          return statusBrown;
        default:
          return infoBlue;
      }
    }

    //fungsi untuk menentukan teks pada status
    String getStatus(BookingStatus statusInfo) {
      final data = intl.toBeginningOfSentenceCase(statusInfo.toString()) ??
          statusInfo.toString();
      return data;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
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
        statusLabel()
      ],
    );
  }

  Widget information() {
    //switch buat atur teks nya berdasarkan status
    Text statusText(BookingStatus textStatus) {
      switch (textStatus) {
        case BookingStatus.declined:
          return Text(
            'Your offer has been declined by admin, you can make another offer to admin or make another booking.',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          );
        case BookingStatus.success:
          return Text(
            'Your payment has been recieved and we will send you the trip detail through email. Thank you.',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          );
        case BookingStatus.waiting:
          return Text(
            'Your offer has been approved by admin and please complete your payment to complete this booking.',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          );
        case BookingStatus.offering:
          return Text(
            'Your offer has been sent to the admin, please wait untill admin approve your offer',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          );
        case BookingStatus.review:
          return Text(
            'Your payment has been sent to the admin, please wait untill admin approve your payment',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          );
        default:
          return const Text('');
      }
    }

    return Column(
      //set status text nya di sini
      children: [statusText(statusNotif)],
    );
  }

  Widget declinedBottom(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(smallRadius)),
          child: TextButton(
              onPressed: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.all(24),
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(bigRadius),
                                topRight: Radius.circular(bigRadius))),
                        child: Column(
                          children: [
                            // Spacer(),
                            Text(
                              'Input price to offer',
                              style: blackTextStyle.copyWith(
                                  fontSize: heading5, fontWeight: semibold),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            CupertinoTextField(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(smallRadius),
                                  border: Border.all(color: lightGray)),
                              padding: const EdgeInsets.all(16),
                              placeholder: 'input price here',
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.popAndPushNamed(
                                      context, '/success-offer');
                                },
                                child: Container(
                                  height: 43,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius:
                                          BorderRadius.circular(smallRadius)),
                                  child: Center(
                                      child: Text(
                                    'Make offer',
                                    style: whiteTextStyle.copyWith(
                                        fontSize: textButton2,
                                        fontWeight: semibold),
                                  )),
                                )),
                            const Spacer()
                          ],
                        ),
                      );
                    });
              },
              child: Text(
                'Make another offer',
                style:
                    whiteTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
              )),
        ),
        const SizedBox(
          height: 8,
        ),
        const CancelButtonWidget()
      ],
    );
  }

  Widget waitingButton(context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(smallRadius)),
          child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/continue-payment');
              },
              child: Text(
                'Continue for payment',
                style:
                    whiteTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
              )),
        ),
        const SizedBox(
          height: 8,
        ),
        const CancelButtonWidget()
      ],
    );
  }

  Widget succesAndReviewing() {
    return Container();
  }

  Widget offeringButton(BuildContext context) {
    return TextButton(
        onPressed: () {
          showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: const Text('Cancel booking'),
                  content: const Text('Are you sure to cancel this booking?'),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text("No"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text(
                        "Yes",
                        style: redTextStyle.copyWith(fontSize: subtitle1),
                      ),
                      onPressed: () {
                        //fungsi cancel booking taruh di sini

                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
        },
        child: Text(
          'Cancel this booking',
          style: redTextStyle.copyWith(
              fontSize: 12, decoration: TextDecoration.underline),
        ));
  }

  @override
  Widget build(BuildContext context) {
    //switch case buat atur button berdasarkan statusnya
    Widget getButton(BookingStatus buttonStatus) {
      switch (buttonStatus) {
        case BookingStatus.declined:
          return declinedBottom(context);
        case BookingStatus.offering:
          return offeringButton(context);
        case BookingStatus.waiting:
          return waitingButton(context);
        case BookingStatus.review:
          return succesAndReviewing();
        case BookingStatus.success:
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
                const Spacer(),
                getButton(statusNotif)
              ],
            ),
          ),
        ));
  }
}
