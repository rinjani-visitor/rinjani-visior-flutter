import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/presentation/utils/internationalization.dart';
import 'package:rinjani_visitor/core/presentation/widget/status.dart';

class OrderListItem extends StatelessWidget {
  final String orderId;
  final String title;
  final String location;
  final String status;
  final DateTime date;
  final void Function()? onTap;
  const OrderListItem(
      {super.key,
      required this.orderId,
      required this.title,
      required this.location,
      required this.status,
      required this.date,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey5,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dateFormat.format(date),
                      style: grayTextStyle.copyWith(
                        fontSize: body3,
                      ),
                    ),
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      location,
                      style: grayTextStyle.copyWith(fontSize: body2),
                    ),
                    const SizedBox(height: 8),
                    Status(status: StatusColor.available, text: status),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
