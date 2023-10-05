import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Text(
            'Wishlist',
            style: blackTextStyle.copyWith(fontSize: 34, fontWeight: bold),
          ),
        ),
        backgroundColor: backgroundColor,
        child: Center(
          child: Text('No content'),
        ));
  }
}
