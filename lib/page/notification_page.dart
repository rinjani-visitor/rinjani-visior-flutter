import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: CupertinoNavigationBar(
          middle: Text('Notification'),
        ),
        child: Center(
          child: Text('No notification'),
        ));
  }
}
