import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/features/product/domain/entity/review.dart';
import 'package:rinjani_visitor/core/presentation/widget/review_card.dart';

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

class ReviewWidgetWrapper extends StatelessWidget {
  final List<ReviewEntity> reviews;

  const ReviewWidgetWrapper({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return ReviewWidget(
      reviewChildren: List.generate(
        reviews.length,
        (index) => ReviewCardWidget(
          name: reviews[index].username,
          createdTime: reviews[index].localizedDateTime,
          message: reviews[index].review,
        ),
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  final List<Widget> reviewChildren;

  const ReviewWidget({super.key, required this.reviewChildren});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
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
