import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/core/constant/constant.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/presentation/utils/internationalization.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';
import 'package:rinjani_visitor/features/booking/domain/enum/history_status.dart';
import 'package:rinjani_visitor/features/booking/presentation/view_model/booking_list.dart';
import 'package:rinjani_visitor/page/booking/payment_method_page.dart';
import 'package:rinjani_visitor/core/presentation/widget/button/primary_button.dart';
import 'package:rinjani_visitor/core/presentation/widget/status.dart';

class BookingHistoryPage extends ConsumerStatefulWidget {
  const BookingHistoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BookingHistoryPageState();
}

class _BookingHistoryPageState extends ConsumerState<BookingHistoryPage> {
  Future<void>? _deleteStatus;

  void _bookingHistoryTapped(BookingEntity entity) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Barrier",
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Container(
            height: 300,
            padding: EdgeInsets.all(24),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: CupertinoColors.systemGrey6,
                borderRadius: BorderRadius.circular(12)),
            child: SizedBox.expand(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text("Status:"), Text(entity.bookingStatus.name)],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text("UTC:"),
                  //     Text(entity.bookingDate.timeZoneName.toString())
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Date:"),
                      Row(
                        children: [
                          Text(
                            dateFormat.format(
                              entity.bookingDate,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            timeFormat.format(
                            entity.bookingDate,
                            )
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    entity.title,
                    style: blackTextStyle.copyWith(
                        fontSize: heading4, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text("Note from admin: "),
                  Text(entity.bookingNote.toString())
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _deleteBooking(String id) async {
    _deleteStatus =
        ref.read(bookingListViewModelProvider.notifier).deleteBooking(id);
    _deleteStatus?.whenComplete(() {
      final _ = ref.refresh(bookingListViewModelProvider);
    }).catchError((e) => Fluttertoast.showToast(msg: e.toString()));
  }

  @override
  Widget build(BuildContext context) {
    final bookingData = ref.watch(bookingListViewModelProvider);
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
              final _ = ref.refresh(bookingListViewModelProvider);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  left: LIST_HORIZONTAL_PADDING,
                  right: LIST_HORIZONTAL_PADDING,
                  top: LIST_VERTICAL_PADDING),
              child: switch (bookingData) {
                AsyncData(:final value) => ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      final current = value[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: LIST_VERTICAL_PADDING,
                        ),
                        child: OrderHistoryCard(
                          id: current.bookingId,
                          title: current.title,
                          note: current.bookingNote,
                          imgUrl: "",
                          status: current.bookingStatus,
                          dateTime: current.bookingDate,
                          onTap: () {
                            _bookingHistoryTapped(current);
                          },
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
                                        bookingId: current.bookingId,
                                      ),
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
                                                _deleteBooking(
                                                    current.bookingId);
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
                AsyncError(
                  :final error,
                ) =>
                  Center(
                    child: Text(error.toString()),
                  ),
                _ => const Center(
                    child: CupertinoActivityIndicator(),
                  ),
              },
            )),
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
