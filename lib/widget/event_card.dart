import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageContainer() {
      return Container(
        width: double.infinity,
        height: 181,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/event.jpeg')),
            borderRadius: BorderRadius.circular(8)),
      );
    }

    Widget information() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lombok Festival',
            style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: lightGray,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    '12 - 08 - 2023',
                    style: blackTextStyle.copyWith(fontSize: 14),
                  )
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: lightGray,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    '08:00 AM',
                    style: blackTextStyle.copyWith(fontSize: 14),
                  )
                ],
              ),
            ],
          )
        ],
      );
    }

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/event-detail-page');
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageContainer(),
            SizedBox(
              height: 16,
            ),
            information()
          ],
        ),
      ),
    );
  }
}
