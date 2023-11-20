import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/widget/rating_widget.dart';

class SmallProductCard extends StatelessWidget {
  final String title;
  final ImageProvider image;
  final String? rating;
  final void Function()? onTap;

  const SmallProductCard(
      {super.key,
      required this.title,
      this.rating,
      required this.image,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: 177,
        height: 275,
        margin: const EdgeInsets.only(left: 16),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 165,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(smallRadius),
              ),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image(fit: BoxFit.cover, image: image),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Text(
                title,
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
              ),
            ),
            RatingWidget(rating: rating)
          ],
        ),
      ),
    );
  }
}
