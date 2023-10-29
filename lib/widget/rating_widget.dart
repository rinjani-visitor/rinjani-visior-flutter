import 'package:flutter/cupertino.dart';

class RatingWidget extends StatelessWidget {
  final String? rating;
  const RatingWidget({Key? key, this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/star.png'))),
        ),
        SizedBox(
          width: 6,
        ),
        Text(rating ?? "-,-")
      ],
    );
  }
}
