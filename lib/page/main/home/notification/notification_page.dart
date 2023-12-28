import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/features/notification/presentation/view_model/notification.dart';
import 'package:rinjani_visitor/core/presentation/widget/notification_card.dart';
import 'package:rinjani_visitor/core/presentation/widget/status.dart';

class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({super.key});

  @override
  ConsumerState<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notificationViewModelProvider);
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
                  return data.isEmpty
                      ? const Center(
                          child: Text("Your notification is empty"),
                        )
                      : ListView.builder(
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
