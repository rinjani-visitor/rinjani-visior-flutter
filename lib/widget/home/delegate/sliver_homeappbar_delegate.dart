import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:badges/badges.dart' as badges;

class SliverHomeAppbarDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  SliverHomeAppbarDelegate({required this.title});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(bigRadius),
              bottomRight: Radius.circular(bigRadius))),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hi, $title',
                  style: whiteTextStyle.copyWith(
                      fontSize: heading3, fontWeight: bold),
                ),
                CupertinoButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/notification');
                    },
                    child: badges.Badge(
                      child: Icon(
                        Icons.notifications,
                        color: whiteColor,
                      ),
                    )),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
              child: CupertinoSearchTextField(
                backgroundColor: whiteColor,
                enabled: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 180;

  @override
  double get minExtent => 150;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
