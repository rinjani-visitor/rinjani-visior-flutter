import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/notification_card_widget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: CupertinoNavigationBar(
          middle: Text('Notification'),
        ),
        child: SafeArea(
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              NotificationCardWidget(
                title: '✅ Your order has been approved',
                subtitle:
                    'Your price offer for Rinjani trip has been approved. Click this for detail information.',
              ),
              NotificationCardWidget(
                title: '✅ Your order has been approved',
                subtitle:
                    'Your price offer for Rinjani trip has been approved. Click this for detail information.',
              ),
              NotificationCardWidget(
                title: '✅ Your order has been approved',
                subtitle:
                    'Your price offer for Rinjani trip has been approved. Click this for detail information.',
              ),
            ],
          ),
        )));
  }
}
