import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        padding: EdgeInsets.only(top: 66, left: 16, right: 16, bottom: 18),
        width: 390,
        height: 257,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(bigRadius),
                bottomRight: Radius.circular(bigRadius))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Hi, Alex',
                  style:
                      whiteTextStyle.copyWith(fontSize: 34, fontWeight: bold),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      size: 32.0,
                      color: whiteColor,
                    ))
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Explore',
                  style: whiteTextStyle.copyWith(
                      fontSize: 20, fontWeight: semibold),
                ),
                Text(
                  'Find the trip of your dreams',
                  style: whiteTextStyle.copyWith(
                      fontSize: 20, fontWeight: semibold),
                ),
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [header()],
      ),
    );
  }
}
