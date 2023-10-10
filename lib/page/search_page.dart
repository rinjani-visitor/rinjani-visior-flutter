import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/auto_search.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      navigationBar: const CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        padding: EdgeInsetsDirectional.only(bottom: 8),
        middle: const AutoSearch(),
      ),
      child: const Center(child: Text('No Content')),
    );
  }
}
