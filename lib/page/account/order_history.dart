import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/features/order/presentation/view_model/order_list.dart';
import 'package:rinjani_visitor/features/order/presentation/widget/order_list_item.dart';
import 'package:rinjani_visitor/page/review/write_review_dialog.dart';

class OrderHistoryPage extends ConsumerStatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OrderHistoryPageState();
}

class _OrderHistoryPageState extends ConsumerState<OrderHistoryPage> {
  @override
  Widget build(BuildContext context) {
    final orderList = ref.watch(orderListViewModelProvider);
    return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemGrey6,
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            "Order history",
            style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        child: SafeArea(
          child: orderList.when(
              loading: () => const Center(
                    child: CupertinoActivityIndicator(),
                  ),
              error: (e, s) => Center(
                    child: Text(e.toString()),
                  ),
              data: (orders) => orders.isNotEmpty
                  ? ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        final order = orders[index];
                        return OrderListItem(
                          orderId: order.id,
                          title: order.title,
                          location: order.location ?? "",
                          status: order.status,
                          date: order.approvedAt,
                          onTap: () {
                            showCupertinoDialog(
                                context: context,
                                builder: (context) {
                                  return ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxHeight: 300),
                                    child: CupertinoPageScaffold(
                                      child: WriteReviewPage(order.id),
                                    ),
                                  );
                                });
                          },
                        );
                      },
                    )
                  : const Center(
                      child: Text("No order history"),
                    )),
        ));
  }
}
