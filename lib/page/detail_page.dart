import 'package:flutter/cupertino.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        child: SafeArea(
            child: Center(
      child: Text('hello worlds'),
    )));
  }
}
