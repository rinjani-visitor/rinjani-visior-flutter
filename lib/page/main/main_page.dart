import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/page/main/account_page.dart';
import 'package:rinjani_visitor/page/main/event_page.dart';
import 'package:rinjani_visitor/page/main/home_page.dart';
import 'package:rinjani_visitor/page/main/wishlist_page.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            inactiveColor: lightGray,
            activeColor: primaryColor,
            items: const [
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
              return const HomePage();
            case 1:
              return const EventPage();
            case 2:
              return const WishlistPage();
            case 3:
              return const AccountPage();
            default:
              return const HomePage();
          }
        });
  }
}
