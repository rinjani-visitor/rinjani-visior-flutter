import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/enums/booking_enum.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/features/notification/presentation/notification_riverpod.dart';
import 'package:rinjani_visitor/widget/notification_card_widget.dart';
import 'package:rinjani_visitor/widget/status.dart';

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

class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({super.key});

  @override
  ConsumerState<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  //TODO: change this when backend is finished
  final data = dataMock;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notificationRiverpodProvider);
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Notification'),
        ),
        child: SafeArea(
            child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: RefreshIndicator.adaptive(
              onRefresh: () async {
                // await ref.read(notificationRiverpodProvider.notifier).refresh();
                await Future.delayed(const Duration(seconds: 2));
              },
              child: state.when(
                data: (data) {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final current = data[index];
                      return NotificationCardWidget(
                        data: current,
                        title: current.title,
                        subtitle: current.description,
                        status: current.status ?? StatusColor.loading,
                      );
                    },
                  );
                },
                error: (error, stackTrace) {
                  return Center(
                    child: Text("Error occured: ${error.toString()}"),
                  );
                },
                loading: () {
                  return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) =>
                        const NotificationCardWidget(
                            title: "",
                            subtitle: "",
                            status: StatusColor.loading),
                  );
                },
              )),
        )));
  }
}
