import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/review_card_widget.dart';

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
          Text(
            'Reviews',
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
          ),
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
