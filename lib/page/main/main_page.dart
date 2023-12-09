import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/booking/presentation/view_model/booking_list.dart';
import 'package:rinjani_visitor/features/booking/presentation/view_model/booking_notification.dart';
import 'package:rinjani_visitor/page/main/booking/booking_history_page.dart';
import 'package:rinjani_visitor/page/main/account/account_page.dart';
import 'package:rinjani_visitor/page/main/home/home_page.dart';
import 'package:rinjani_visitor/page/main/wishlist/wishlist_page.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

class MainPage extends ConsumerWidget with WidgetsBindingObserver {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // call this booking to trigger booking notification status
      ref.read(bookingListViewModelProvider);
    });
    final bookingStatus = ref.watch(bookingNotificationViewModelProvider);
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          inactiveColor: lightGray,
          activeColor: primaryColor,
          height: 60,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'home',
            ),
            BottomNavigationBarItem(
                icon: Badge(
                  isLabelVisible: bookingStatus,
                  child: const Icon(
                    Icons.list_alt_rounded,
                  ),
                ),
                label: 'Your Booking'),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                ),
                label: 'Favorites'),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Account'),
          ]),
      tabBuilder: (context, index) {
        switch (index) {
          case 1:
            ref.read(bookingListViewModelProvider.notifier).onPageRefresh();
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
