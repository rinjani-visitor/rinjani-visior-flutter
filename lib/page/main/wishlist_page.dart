import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Wishlist'),
          ),
          SliverFillRemaining(
            child: Center(
              child: Column(
                children: [Text('no content')],
              ),
            ),
          )
        ],
      ),
    );
  }
}
