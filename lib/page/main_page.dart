import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/page/account_page.dart';
import 'package:rinjani_visitor/page/event_page.dart';
import 'package:rinjani_visitor/page/home_page.dart';
import 'package:rinjani_visitor/page/wishlist_page.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            inactiveColor: lightGray,
            activeColor: primaryColor,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calendar_month,
                  ),
                  label: 'Events'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border,
                  ),
                  label: 'Wishlist'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Account'),
            ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return HomePage();
            case 1:
              return EventPage();
            case 2:
              return WishlistPage();
            case 3:
              return AccountPage();
            default:
              return HomePage();
          }
        });
  }
}
