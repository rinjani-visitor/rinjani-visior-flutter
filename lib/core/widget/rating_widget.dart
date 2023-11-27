import 'package:flutter/cupertino.dart';

class RatingWidget extends StatelessWidget {
  final String? rating;
  const RatingWidget({super.key, this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/star.png'))),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(rating ?? "-,-")
      ],
    );
  }
}
