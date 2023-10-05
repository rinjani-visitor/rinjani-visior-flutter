import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/input_field.dart';

class BookingDetailPage extends StatelessWidget {
  const BookingDetailPage({Key? key}) : super(key: key);

  Widget imageTitle() {
    return Container(
      width: double.infinity,
      height: 157,
      padding: EdgeInsets.all(16),
      color: whiteColor,
      child: Row(
        children: [
          Container(
            width: 181,
            height: 125,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(smallRadius),
                color: primaryColor),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Rinjani Trip',
                style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
              ),
              Text(
                'Lombok, Indonesia',
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              ),
              Text(
                'Duration: 2 Days 1 night',
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget tripDetail() {
    return Container(
      padding: EdgeInsets.all(16),
      height: 162,
      color: whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trip detail',
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
          ),
          SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: blackColor,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    '20 - 08 - 2023',
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  )
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: blackColor,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    '09:00 AM',
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget addOn() {
    return Container(
      padding: EdgeInsets.all(16),
      color: whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your add on',
            style: blackTextStyle.copyWith(fontSize: 20),
          ),
          CupertinoListTile(
              padding: EdgeInsets.all(0),
              leading: Icon(
                Icons.time_to_leave,
                color: blackColor,
              ),
              title: Text(
                '+Rp.200.000',
                style: greenTextStyle,
              ))
        ],
      ),
    );
  }

  Widget payment() {
    return Container(
      height: 180,
      color: whiteColor,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          InputField(
            label: 'Enter your price offer',
            secureText: false,
            placeholder: 'Price should be in range',
          ),
          CupertinoButton(
              child: Container(
                  height: 43,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(smallRadius)),
                  child: Center(
                      child: Text(
                    'Make an offer',
                    style: whiteTextStyle.copyWith(fontWeight: medium),
                  ))),
              onPressed: () {})
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: CupertinoNavigationBar(
          middle: Text('Booking details'),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              imageTitle(),
              SizedBox(
                height: 8,
              ),
              tripDetail(),
              SizedBox(
                height: 8,
              ),
              addOn(),
              SizedBox(
                height: 8,
              ),
              payment()
            ],
          ),
        ));
  }
}
