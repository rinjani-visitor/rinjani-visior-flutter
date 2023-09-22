import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/rating_widget.dart';

class BigCard extends StatelessWidget {
  const BigCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget status() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(smallRadius), color: infoBlue),
        child: Text(
          'Available',
          style: whiteTextStyle.copyWith(fontSize: 10, fontWeight: regular),
        ),
      );
    }

    Widget imageContainer() {
      return Container(
        width: 108,
        height: 136,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(bigRadius),
                bottomLeft: Radius.circular(bigRadius))),
      );
    }

    Widget information() {
      return Container(
        height: 113,
        width: 221,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [status(), Spacer(), RatingWidget()],
            ),
            Spacer(),
            Text(
              'Rinjani Trip',
              style:
                  blackTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  '\$20 - \$40/Person',
                  style: blackTextStyle.copyWith(fontWeight: medium),
                ),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Container(
                      width: 69,
                      height: 23,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(smallRadius)),
                      child: Center(
                        child: Text(
                          "Booking",
                          style: whiteTextStyle.copyWith(
                              fontSize: 12, fontWeight: semibold),
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
      );
    }

    return Container(
        width: 357,
        height: 136,
        margin: EdgeInsets.only(left: 16, top: 16),
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(bigRadius)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageContainer(),
            SizedBox(
              width: 16,
            ),
            information()
          ],
        ));
  }
}
