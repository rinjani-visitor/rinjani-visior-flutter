import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/big_card.dart';
import 'package:rinjani_visitor/widget/status.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({Key? key}) : super(key: key);
  Widget imageContainer() {
    return Container(
      width: double.infinity,
      height: 241,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/event.jpeg'))),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rinjani Trip',
            style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
          )
        ],
      ),
    );
  }

  Widget eventHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: whiteColor),
      child: Column(
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
                    width: 8,
                  ),
                  Text(
                    '10 - 8 - 2023',
                    style: grayTextStyle.copyWith(
                      fontSize: 16,
                    ),
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
                    width: 8,
                  ),
                  Text(
                    '10 - 8 - 2023',
                    style: grayTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex',
            style: blackTextStyle.copyWith(fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget availableTrip() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Availabe Trip',
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: BigCard(
                        image: AssetImage("assets/rinjani.jpeg"),
                        title: "Rinjani Trip",
                        price: "\$80 - \$90 - Person",
                        status: StatusColor.available,
                        rating: "4.9"),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: CupertinoNavigationBar(
          middle: Text('Event detail'),
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [imageContainer(), eventHeader(), availableTrip()],
        ));
  }
}
