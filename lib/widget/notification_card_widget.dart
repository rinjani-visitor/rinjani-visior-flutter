import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/enumerate/booking_enum.dart';
import 'package:rinjani_visitor/page/notification_detail_page.dart';
import 'package:rinjani_visitor/core/theme/theme.dart';

class NotificationCardWidget extends StatelessWidget {
  final String title;
  final BookingStatus status;
  final String subtitle;
  const NotificationCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: CupertinoListTile(
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => NotificationDetailPage(
                        statusNotif: status,
                      )));
        },
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        title: Text(
          title,
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
        ),
        subtitle: Text(subtitle),
        backgroundColor: whiteColor,
        trailing: Icon(
          Icons.chevron_right,
          color: lightGray,
          size: 32,
        ),
      ),
    );
  }
}
