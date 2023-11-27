import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/features/notification/domain/entity/notification.dart';
import 'package:rinjani_visitor/core/widget/status.dart';

class NotificationDetailPage extends StatelessWidget {
  /// change status
  final NotificationEntity data;
  const NotificationDetailPage({super.key, required this.data});

  Widget imageContainer() {
    return Container(
      width: double.infinity,
      height: 218,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(smallRadius)),
    );
  }

  Widget header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(
              'ID: JBEU183382B',
              style: grayTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const Spacer(),
            Status(
              status: data.status ?? StatusColor.init,
              text: "approval",
            ),
          ],
        ),
        Text(
          'Rinjani Trip',
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
        ),
        Text(
          'Recieved: 12 - 08 - 2023',
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
        ),
      ],
    );
  }

  Widget information(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      //set status text nya di sini
      children: [Text(text)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: const CupertinoNavigationBar(
          previousPageTitle: 'Back',
          middle: Text('Payment Status'),
        ),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: [
                imageContainer(),
                const SizedBox(
                  height: 24,
                ),
                header(),
                const SizedBox(
                  height: 24,
                ),
                information(data.description),
                const Spacer(),
              ],
            ),
          ),
        ));
  }
}
