import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

class SliverHomeAppbarDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final Widget? leading;
  SliverHomeAppbarDelegate({
    required this.title,
    this.leading,
  });
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
                leading ?? const SizedBox(),
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
