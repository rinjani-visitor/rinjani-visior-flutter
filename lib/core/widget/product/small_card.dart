import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/constant/constant.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/widget/rating_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SmallProductCard extends StatelessWidget {
  final String title;
  final bool loading;
  final String? imageUrl;
  final String? rating;
  final void Function()? onTap;

  const SmallProductCard({
    super.key,
    required this.title,
    this.imageUrl = "",
    this.loading = false,
    this.onTap,
    this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
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
                  child: loading
                      ? Image.asset(
                          "assets/rinjani.jpeg",
                          fit: BoxFit.cover,
                        )
                      : CachedNetworkImage(
                          imageUrl: imageUrl ?? IMG_PLACEHOLDER,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Skeletonizer(
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(9)),
                            ),
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
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
