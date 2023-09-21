import 'package:flutter/cupertino.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({Key? key}) : super(key: key);

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
        Text('4,98')
      ],
    );
  }
}
