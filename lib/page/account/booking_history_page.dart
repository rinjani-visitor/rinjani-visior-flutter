import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/presentation/utils/internationalization.dart';
import 'package:rinjani_visitor/features/booking_history/domain/entitiy/booking_history.dart';
import 'package:rinjani_visitor/widget/status.dart';

final List<BookingHistoryEntity> mockData = [
  BookingHistoryEntity(
      id: "dfakdj",
      title: "Rinjani Summit",
      dateTime: DateTime.now(),
      status: "not started"),
  BookingHistoryEntity(
      id: "dfakdja",
      title: "Booking 1",
      dateTime: DateTime.now(),
      status: "success"),
];

class BookingHistoryPage extends ConsumerStatefulWidget {
  const BookingHistoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BookingHistoryPageState();
}

class _BookingHistoryPageState extends ConsumerState<BookingHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey6,
      child: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverToBoxAdapter(
              child: CupertinoNavigationBar(
                middle: Text("Booking"),
              ),
            )
          ],
          body: RefreshIndicator.adaptive(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 2));
            },
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: mockData.length,
              itemBuilder: (context, index) {
                final current = mockData[index];
                return GestureDetector(
                  onTap: () {
                    // TODO: navigate to booking history detail page
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: CupertinoColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: const Image(
                              image: AssetImage('assets/products/coffee.jpg')),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(current.title,
                                    style: blackTextStyle.copyWith(
                                        fontSize: heading5,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                Status(
                                    status: StatusColor.loading,
                                    text: current.status)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_today_outlined,
                                        size: 16, color: CupertinoColors.black),
                                    const SizedBox(width: 4),
                                    Text(dateFormat.format(current.dateTime),
                                        style: blackTextStyle.copyWith(
                                            fontSize: subtitle1)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.access_time_outlined,
                                        size: 16, color: CupertinoColors.black),
                                    const SizedBox(width: 4),
                                    Text(timeFormat.format(current.dateTime),
                                        style: blackTextStyle),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
