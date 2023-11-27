import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/features/notification/domain/entity/notification.dart';
import 'package:rinjani_visitor/page/main/home/notification/notification_detail_page.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/widget/status.dart';

class NotificationCardWidget extends StatelessWidget {
  final String title;
  final StatusColor status;
  final String subtitle;
  final NotificationEntity? data;
  const NotificationCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.status,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: CupertinoListTile(
        onTap: () {
          if (data == null) {
            return;
          }
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => NotificationDetailPage(
                        data: data!,
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
