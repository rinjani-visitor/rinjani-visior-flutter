import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:rinjani_visitor/core/go_router_builder.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/add_on_widget.dart';
import 'package:rinjani_visitor/widget/like_widget.dart';
import 'package:rinjani_visitor/widget/rating_widget.dart';
import 'package:rinjani_visitor/widget/segmented_widget.dart';
import 'package:rinjani_visitor/widget/status.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  Widget imageContainer() {
    return Container(
      width: double.infinity,
      height: 241,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/rinjani.jpeg'))),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Rinjani Trip',
                style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
              ),
              Spacer(),
              Status(
                status: StatusColor.available,
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Icon(
                Icons.location_pin,
                color: lightGray,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Lombok, Indonesia',
                style: grayTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                '\$20 - \$40/person',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
              ),
              Spacer(),
              LikeButton()
            ],
          ),
          SizedBox(
            height: 8,
          ),
          RatingWidget(),
          SizedBox(
            height: 8,
          ),
          Text(
            'Trip duration: 2 Days - 1 Night',
            style: blackTextStyle.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Detail Trip'),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  imageContainer(),
                  header(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SegmentedWidget(),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
