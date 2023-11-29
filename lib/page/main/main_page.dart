import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/page/account/booking_history_page.dart';
import 'package:rinjani_visitor/page/main/account/account_page.dart';
import 'package:rinjani_visitor/page/main/event/event_page.dart';
import 'package:rinjani_visitor/page/main/home/home_page.dart';
import 'package:rinjani_visitor/page/main/wishlist/wishlist_page.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
                  Icons.list_alt_rounded,
                ),
                label: 'Your Booking'),
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
          case 1:
            return const BookingHistoryPage();
          case 2:
            return const WishlistPage();
          case 3:
            return const AccountPage();
          default:
            return const HomePage();
        }
      },
    );
  }
}
