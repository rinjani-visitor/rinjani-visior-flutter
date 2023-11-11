import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/widget/rating_widget.dart';
import 'package:rinjani_visitor/widget/status.dart';

class BigProductCard extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final StatusColor status;
  final String price;
  final String? rating;
  final void Function()? onTap;
  const BigProductCard(
      {super.key,
      required this.image,
      required this.title,
      required this.status,
      required this.price,
      this.rating,
      this.onTap});
  Widget _imageContainer() {
    return Container(
      width: 108,
      height: 136,
      decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover, image: image),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(bigRadius),
              bottomLeft: Radius.circular(bigRadius))),
    );
  }

  Widget _information() {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Status(
                  status: status,
                ),
                const Spacer(),
                RatingWidget(
                  rating: rating,
                )
              ],
            ),
            const Spacer(),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style:
                  blackTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  price,
                  style:
                      blackTextStyle.copyWith(fontWeight: medium, fontSize: 14),
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //widget buat informasi yang ada di card

    return GestureDetector(
      //function buat ke halaman detail
      onTap: onTap,
      //
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 136,
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(bigRadius)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_imageContainer(), _information()],
          )),
    );
  }
}
