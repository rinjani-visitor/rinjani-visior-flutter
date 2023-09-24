import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/rating_widget.dart';

class SmallCard extends StatelessWidget {
  const SmallCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-page');
      },
      child: Container(
        width: 177,
        height: 218,
        margin: EdgeInsets.only(left: 16),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(18)),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 84,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(smallRadius),
                color: primaryColor,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rinjani Trip',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semibold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  RatingWidget(),
                  SizedBox(
                    height: 8,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(smallRadius),
                            color: primaryColor),
                        child: Center(
                            child: Text(
                          'Booking',
                          style: whiteTextStyle.copyWith(
                              fontSize: 12, fontWeight: semibold),
                        )),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
