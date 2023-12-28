import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/presentation/utils/internationalization.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

class EventCard extends StatelessWidget {
  final String title;
  final DateTime date;
  final void Function()? onTap;
  const EventCard(
      {super.key, required this.title, required this.date, this.onTap});

  @override
  Widget build(BuildContext context) {
    Widget imageContainer() {
      return Container(
        width: double.infinity,
        height: 181,
        decoration: BoxDecoration(
            image: const DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/Google.png')),
            borderRadius: BorderRadius.circular(8)),
      );
    }

    Widget information() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: lightGray,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    dateFormat.format(date),
                    style: blackTextStyle.copyWith(fontSize: 14),
                  )
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    color: lightGray,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    '08:00 AM',
                    style: blackTextStyle.copyWith(fontSize: 14),
                  )
                ],
              ),
            ],
          )
        ],
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageContainer(),
            const SizedBox(
              height: 16,
            ),
            information()
          ],
        ),
      ),
    );
  }
}
