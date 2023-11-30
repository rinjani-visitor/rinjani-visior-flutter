import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/presentation/utils/internationalization.dart';
import 'package:rinjani_visitor/features/booking/domain/enum/history_status.dart';
import 'package:rinjani_visitor/features/booking/presentation/view_model/booking.dart';
import 'package:rinjani_visitor/page/booking/payment_method_page.dart';
import 'package:rinjani_visitor/page/review/write_review_dialog.dart';
import 'package:rinjani_visitor/core/widget/button/primary_button.dart';
import 'package:rinjani_visitor/core/widget/status.dart';

class BookingHistoryPage extends ConsumerStatefulWidget {
  const BookingHistoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BookingHistoryPageState();
}

class _BookingHistoryPageState extends ConsumerState<BookingHistoryPage> {
  void _bookingHistoryTapped(String id) {}

  @override
  Widget build(BuildContext context) {
    final bookingData = ref.watch(bookingViewModelProvider);
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey6,
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "booking history",
          style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      child: SafeArea(
        child: RefreshIndicator.adaptive(
            onRefresh: () async {
              final result = await ref.refresh(bookingViewModelProvider);
            },
            child: switch (bookingData) {
              AsyncData(:final value) => ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final current = value[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: OrderHistoryCard(
                        id: current.bookingId,
                        title: current.title,
                        note: current.bookingNote,
                        imgUrl: "",
                        status: current.bookingStatus,
                        dateTime: current.bookingDate,
                        onTap: () {},
                        action: switch (current.bookingStatus) {
                          BookingStatus.success => PrimaryButton(
                              child: Text("Go to order"),
                              onPressed: () {
                                Navigator.pushNamed(context, "/order");
                              }),
                          BookingStatus.waitingForPayment => PrimaryButton(
                              child: Text("Send Proof of Payment"),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => PaymentMethodPage(
                                        bookingId: current.bookingId),
                                  ),
                                );
                              },
                            ),
                          BookingStatus.offering ||
                          BookingStatus.declined =>
                            PrimaryButton(
                              onPressed: () {
                                showCupertinoDialog(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoAlertDialog(
                                        title: const Text("Cancel Booking"),
                                        content: const Text(
                                            "Are you sure want to cancel this booking?"),
                                        actions: [
                                          CupertinoDialogAction(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("No"),
                                          ),
                                          CupertinoDialogAction(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Yes"),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              backgroundColor: CupertinoColors.systemGrey,
                              child: Text("Cancel Booking"),
                            ),
                          _ => const SizedBox(),
                        },
                      ),
                    );
                  },
                ),
              AsyncError(:final error, :final stackTrace) => Center(
                  child: Text(error.toString()),
                ),
              _ => const Center(
                  child: CupertinoActivityIndicator(),
                ),
            }),
      ),
    );
  }
}

class OrderHistoryCard extends StatelessWidget {
  final String id;
  final String title;
  final String? note;
  final String imgUrl;
  final BookingStatus status;
  final DateTime dateTime;
  final Widget? action;
  final Function() onTap;
  const OrderHistoryCard({
    super.key,
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.status,
    required this.dateTime,
    this.note,
    required this.onTap,
    this.action,
  });

  StatusColor _fromHistoryStatus(BookingStatus? status) {
    switch (status) {
      case BookingStatus.declined:
      case BookingStatus.paymentFailed:
        return StatusColor.error;
      case BookingStatus.paymentReview:
      case BookingStatus.offering:
        return StatusColor.loading;
      case BookingStatus.success:
      case BookingStatus.waitingForPayment:
        return StatusColor.success;
      default:
        return StatusColor.init;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: CupertinoColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ClipRRect(
            //     borderRadius: BorderRadius.circular(8),
            //     child: CachedNetworkImage(
            //         imageUrl: IMG_PLACEHOLDER, fit: BoxFit.fitWidth)),
            // const SizedBox(height: 12),
            Text(
              "ID: $id",
              style: grayTextStyle.copyWith(fontSize: body3),
            ),
            Text(title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: blackTextStyle.copyWith(
                    fontSize: heading5, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Tooltip(
                      message: note ?? "",
                      child: Status(
                          status: _fromHistoryStatus(status),
                          text: status.value),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.calendar_today_outlined,
                                size: 16, color: CupertinoColors.black),
                            const SizedBox(width: 4),
                            Text(dateFormat.format(dateTime),
                                style: blackTextStyle.copyWith(
                                    fontSize: subtitle1)),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.access_time_outlined,
                                size: 16, color: CupertinoColors.black),
                            const SizedBox(width: 4),
                            Text(timeFormat.format(dateTime),
                                style: blackTextStyle),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 12),
            action ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
