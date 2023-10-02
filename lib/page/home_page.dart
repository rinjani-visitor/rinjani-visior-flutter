import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/add_on_widget.dart';
import 'package:rinjani_visitor/widget/big_card.dart';
import 'package:rinjani_visitor/widget/category_item.dart';
import 'package:rinjani_visitor/widget/search_delegate.dart';
import 'package:rinjani_visitor/widget/small_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _categories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
          ),
          const SizedBox(
            height: 16,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryItem(
                label: 'Rinjani',
                iconName: Icons.landscape,
              ),
              CategoryItem(
                label: 'Home Stay',
                iconName: Icons.hotel,
              ),
              CategoryItem(
                label: 'Culture',
                iconName: Icons.self_improvement,
              ),
              CategoryItem(
                label: 'Landscape',
                iconName: Icons.hiking,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _recommended() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16),
          child: Text(
            'Recommeded',
            style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const SingleChildScrollView(
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

  Widget _rinjaniTrip() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Rinjani Trip',
              style:
                  blackTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
            ),
          ),
          const BigCard(),
          const BigCard(),
          const BigCard(),
          const BigCard(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 140),
          child: Container(
            padding:
                const EdgeInsets.only(top: 48, left: 16, right: 16, bottom: 18),
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
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/notification-page');
                        },
                        icon: Icon(
                          Icons.notifications,
                          size: 32.0,
                          color: whiteColor,
                        ))
                  ],
                ),
                const Expanded(child: Center()),
                CupertinoSearchTextField(
                  onTap: () {
                    Navigator.pushNamed(context, '/search-page');
                  },
                  backgroundColor: whiteColor,
                ),
              ],
            ),
          )),
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          const SizedBox(
            height: 24,
          ),
          _categories(),
          const SizedBox(
            height: 24,
          ),
          _recommended(),
          const SizedBox(
            height: 24,
          ),
          _rinjaniTrip()
        ],
      ),
    );
  }
}
