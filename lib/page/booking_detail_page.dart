import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class BookingDetailPage extends StatelessWidget {
  const BookingDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: CupertinoNavigationBar(
          middle: Text('Booking details'),
        ),
        child: Center(
          child: Text('booking details'),
        ));
  }
}
