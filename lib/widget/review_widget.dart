import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/review_card_widget.dart';

class ReviewWidgetMock extends StatelessWidget {
  const ReviewWidgetMock({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReviewWidget(
      reviewChildren: [
        ReviewCardWidget(
            name: "Kevin",
            createdTime: " weeks ago",
            message: "This place is amazing, I love it"),
        ReviewCardWidget(
            name: "Kevin",
            createdTime: " weeks ago",
            message: "This place is amazing, I love it"),
      ],
    );
  }
}

class ReviewWidget extends StatelessWidget {
  final List<Widget> reviewChildren;
  const ReviewWidget({Key? key, required this.reviewChildren})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: reviewChildren,
            ),
          )
        ],
      ),
    );
  }
}
