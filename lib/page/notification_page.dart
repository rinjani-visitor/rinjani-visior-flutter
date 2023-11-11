import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/core/enums/booking_enum.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/widget/notification_card_widget.dart';

const List<Map<String, dynamic>> dataMock = [
  {
    'title': '✅ Your order has been approved',
    'subtitle':
        'Your price offer for Rinjani trip has been approved. Click this for detail information.',
    'status': BookingStatus.success
  },
  {
    'title': '✅ Your order has been approved',
    'subtitle':
        'Your price offer for Rinjani trip has been approved. Click this for detail information.',
    'status': BookingStatus.success
  },
  {
    'title': '✅ Your order has been approved',
    'subtitle':
        'Your price offer for Rinjani trip has been approved. Click this for detail information.',
    'status': BookingStatus.success
  }
];

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  //TODO: change this when backend is finished
  final data = dataMock;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Notification'),
        ),
        child: SafeArea(
            child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return NotificationCardWidget(
                title: data[index]['title'],
                subtitle: data[index]['subtitle'],
                status: data[index]['status'],
              );
            },
          ),
        )));
  }
}
