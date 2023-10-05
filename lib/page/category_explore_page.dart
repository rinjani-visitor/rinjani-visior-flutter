import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class CategoryExplorePage extends StatelessWidget {
  final String title;
  const CategoryExplorePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: CupertinoNavigationBar(
          middle: Text('${title}'),
        ),
        child: Center(
          child: Text("hello world"),
        ));
  }
}
