import 'dart:math';

import 'package:flutter/cupertino.dart';
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
    double shrinkPercentage = min(1, shrinkOffset / (maxExtent - minExtent));

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _topWidget(),
            const SizedBox(height: 8,),
            Expanded(
                child: Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [

                if (shrinkPercentage != 1)
                  Opacity(
                    opacity: 1.0 - shrinkPercentage,
                    child: _collapsedWidget(),
                  ),
              ],
            )),
            _bottomWidget(context)
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 220;

  @override
  double get minExtent => 175;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  Widget _topWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            'Hi, $title',
            style:
                whiteTextStyle.copyWith(fontSize: heading3, fontWeight: bold),
          ),
        ),
        leading ?? const SizedBox(),
      ],
    );
  }

  Widget _bottomWidget(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        debugPrint('Search');
        Navigator.pushNamed(context, '/search');
      },
      child: const CupertinoSearchTextField(
        backgroundColor: whiteColor,
        enabled: false,
      ),
    );
  }

  Widget _collapsedWidget() {
    return ListView(
      children: [
        Text(
          "Explore",
          style: whiteTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        Text("Find your suitable trip", style: whiteTextStyle,)
      ],
    );
  }
}
