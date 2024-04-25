import 'dart:developer' as developer;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/core/constant/constant.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/presentation/utils/internationalization.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';
import 'package:rinjani_visitor/features/booking/domain/enum/history_status.dart';
import 'package:rinjani_visitor/features/booking/presentation/view_model/booking_detail.dart';
import 'package:rinjani_visitor/features/booking/presentation/view_model/booking_list.dart';
import 'package:rinjani_visitor/page/booking/payment_method_page.dart';
import 'package:rinjani_visitor/core/presentation/widget/button/primary_button.dart';
import 'package:rinjani_visitor/core/presentation/widget/status.dart';

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

class BookingHistoryPage extends ConsumerStatefulWidget {
  const BookingHistoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BookingHistoryPageState();
}

class _BookingHistoryPageState extends ConsumerState<BookingHistoryPage> {
  Future<void>? _deleteStatus;

  void _bookingHistoryTapped(BookingEntity entity) async {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Barrire",
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final easeScale = Curves.easeInOut.transform(animation.value);
        return Transform.scale(
          scale: easeScale,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) => Consumer(
        builder: (context, ref, child) {
          final bookingDetailState =
              ref.watch(bookingDetailViewModelProvider(entity.bookingId));
          return Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              // 50% height
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(12)),
              child: SizedBox.expand(
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  physics: const ClampingScrollPhysics(),
                  children: [
                    CachedNetworkImage(
                      imageUrl: entity.imgUrl ?? "",
                      fit: BoxFit.fill,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemGrey5,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      entity.title,
                      style: blackTextStyle.copyWith(
                          fontSize: heading4, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Status(
                            text: entity.bookingStatus.value,
                            status: _fromHistoryStatus(entity.bookingStatus),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today_outlined,
                                  size: 16, color: CupertinoColors.black),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                dateFormat.format(
                                  entity.bookingDate,
                                ),
                                style: blackTextStyle.copyWith(
                                    fontSize: subtitle3),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                timeFormat.format(
                                  entity.bookingDate,
                                ),
                                style: blackTextStyle.copyWith(
                                    fontSize: subtitle3),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.attach_money_outlined,
                              color: primaryColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                                bookingDetailState.when(
                                  data: (data) => "${data?.offeringPrice}\$",
                                  error: (error, stackTrace) => "${error}",
                                  loading: () => "Loading...",
                                ),
                                style: blackTextStyle.copyWith(
                                    fontSize: subtitle1)),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Row(
                          children: [
                            const Icon(Icons.group,
                                color: CupertinoColors.black),
                            const SizedBox(width: 4),
                            Text(
                              bookingDetailState.when(
                                data: (data) => "${data?.totalPersons}",
                                error: (error, _) => "$error",
                                loading: () => "Loading",
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text("Start : ",
                            style:
                                blackTextStyle.copyWith(fontSize: subtitle1)),
                        Text(
                            bookingDetailState.hasValue
                                ? "${dateFormat.format(bookingDetailState.value!.startDateTime!)} ${timeFormat.format(bookingDetailState.value!.startDateTime!)}"
                                : "Loading...",
                            style:
                                blackTextStyle.copyWith(fontSize: subtitle1)),
                      ],
                    ),
                    Row(
                      children: [
                        Text("AddOn(s): ",
                            style:
                                blackTextStyle.copyWith(fontSize: subtitle1)),
                        Expanded(
                          child: Text(
                            bookingDetailState.when(
                              data: (data) =>
                                  "${data?.addOns != null && data!.addOns!.isNotEmpty ? data.addOns : "empty"}",
                              error: (error, _) => "$error",
                              loading: () => "Loading",
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    MarkdownBody(
                      data: entity.bookingNote ?? "",
                      styleSheetTheme: MarkdownStyleSheetBaseTheme.cupertino,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _deleteBooking(String id) async {
    _deleteStatus =
        ref.read(bookingListViewModelProvider.notifier).deleteBooking(id);
    _deleteStatus?.whenComplete(() {
      final _ = ref.refresh(bookingListViewModelProvider);
    }).catchError((e) => Fluttertoast.showToast(msg: e.toString()));
  }

  void _toPaymentMethodPage(String id) {
    developer.log("To Payment Method Page $id", name: runtimeType.toString());
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => PaymentMethodPage(
          bookingId: id,
        ),
      ),
    );
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
                AsyncData(:final value) => value.isEmpty
                    ? LayoutBuilder(
                        builder: (context, constraints) => ListView(
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: constraints.maxHeight),
                              child: const Center(
                                child: Text("Product is empty"),
                              ),
                            )
                          ],
                        ),
                      )
                    : ListView.builder(
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
                              imgUrl: current.imgUrl ?? "",
                              status: current.bookingStatus,
                              dateTime: current.bookingDate,
                              onTap: () {
                                _bookingHistoryTapped(current);
                              },
                              action: switch (current.bookingStatus) {
                                BookingStatus.success => PrimaryButton(
                                    child: const Text("Go to order"),
                                    onPressed: () {
                                      Navigator.pushNamed(context, "/order");
                                    }),
                                BookingStatus.waitingForPayment ||
                                BookingStatus.paymentFailed =>
                                  PrimaryButton(
                                    child: const Text("Send Proof of Payment"),
                                    onPressed: () {
                                      _toPaymentMethodPage(current.bookingId);
                                    },
                                  ),
                                BookingStatus.offering ||
                                BookingStatus.declined =>
                                  PrimaryButton(
                                    backgroundColor: CupertinoColors.systemRed,
                                    onPressed: () {
                                      showCupertinoDialog(
                                          context: context,
                                          builder: (context) {
                                            return CupertinoAlertDialog(
                                              title:
                                                  const Text("Cancel Booking"),
                                              content: const Text(
                                                  "Are you sure want to cancel this booking?"),
                                              actions: [
                                                CupertinoDialogAction(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("No"),
                                                ),
                                                CupertinoDialogAction(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    _deleteBooking(
                                                        current.bookingId);
                                                  },
                                                  child: const Text("Yes"),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    child: const Text("Cancel Booking"),
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
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                  fit: BoxFit.fitWidth,
                  placeholder: (_, __) => Container(
                    height: 100,
                  ),
                  imageBuilder: (context, provider) => Image(
                    image: provider,
                    height: 100,
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width,
                  ),
                )),
            const SizedBox(height: 12),
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
