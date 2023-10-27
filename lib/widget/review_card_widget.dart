import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class ReviewCardWidget extends StatelessWidget {
  final String name;
  final String createdTime;
  final String message;
  const ReviewCardWidget(
      {Key? key,
      required this.name,
      required this.createdTime,
      required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 198,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          border: Border.all(color: blackColor),
          borderRadius: BorderRadius.circular(bigRadius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: blackTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
              ),
              Text(
                createdTime,
                style: grayTextStyle.copyWith(fontSize: 10),
              )
            ],
          )
        ],
      ),
    );
  }
}
