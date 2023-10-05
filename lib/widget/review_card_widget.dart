import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 198,
      height: 143,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          border: Border.all(color: blackColor),
          borderRadius: BorderRadius.circular(bigRadius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Indah Pemandangan Air Terjun Sindang Gila yang memiliki 2 terjunan, satu-satunya yang ada di Pulau Lombok.',
            style: blackTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kevin',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
              ),
              Text(
                '3 weeks ago',
                style: grayTextStyle.copyWith(fontSize: 10),
              )
            ],
          )
        ],
      ),
    );
  }
}
