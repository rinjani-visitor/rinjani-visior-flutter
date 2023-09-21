import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/category_item.dart';
import 'package:rinjani_visitor/widget/small_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget categories() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style:
                  blackTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryItem(
                  label: 'Rinjani',
                ),
                CategoryItem(
                  label: 'Home Stay',
                ),
                CategoryItem(
                  label: 'Culture',
                ),
                CategoryItem(
                  label: 'Landscape',
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget recommended() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: Text(
              'Recommeded',
              style:
                  blackTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              SmallCard(),
              SmallCard(),
              SmallCard(),
            ]),
          )
        ],
      );
    }

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(390, 124),
          child: Container(
            padding: EdgeInsets.only(top: 48, left: 16, right: 16, bottom: 18),
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
                      style: whiteTextStyle.copyWith(
                          fontSize: 34, fontWeight: bold),
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
                const SizedBox(
                  height: 16,
                ),
                CupertinoSearchTextField(
                  backgroundColor: whiteColor,
                )
              ],
            ),
          )),
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          SizedBox(
            height: 24,
          ),
          categories(),
          SizedBox(
            height: 24,
          ),
          recommended(),
        ],
      ),
    );
  }
}
