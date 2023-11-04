import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/features/product/domain/category_enum.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class CategoryExplorePage extends StatefulWidget {
  final String title;
  final ProductCategory category;
  const CategoryExplorePage(
      {Key? key, required this.title, required this.category})
      : super(key: key);

  @override
  State<CategoryExplorePage> createState() => _CategoryExplorePageState();
}

class _CategoryExplorePageState extends State<CategoryExplorePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: CupertinoNavigationBar(
          middle: Text('${widget.title}'),
        ),
        child: Center(
          child: Text("hello world"),
        ));
  }
}
