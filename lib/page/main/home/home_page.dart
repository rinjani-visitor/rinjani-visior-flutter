import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:badges/badges.dart' as badges;
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth_detail.dart';
import 'package:rinjani_visitor/features/booking/presentation/view_model/booking_list.dart';
import 'package:rinjani_visitor/features/product/presentation/view_model/recommended_product.dart';

import '_widget/category_selector.dart';
import '_widget/event_list.dart';
import '_widget/reccomendation.dart';
import '_widget/sliver_homeappbar_delegate.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  void _toNotification(BuildContext context) {
    Navigator.pushNamed(context, '/notification');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> _refresh() async {
      final _ = ref.refresh(bookingListViewModelProvider.notifier);
      ref.read(recommendedProductViewModelProvider.notifier).refresh();
      await Future.delayed(const Duration(seconds: 2));
    }

    final userDetail = ref.watch(authDetailViewModelProvider);
    final username = ref.watch(authViewModelProvider).value?.username ?? "User";
    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [

          SliverPersistentHeader(
            floating: true,
            pinned: true,
            delegate: SliverHomeAppbarDelegate(
              title: userDetail.asData?.value?.name ?? username,
              leading: CupertinoButton(
                  onPressed: () => _toNotification(context),
                  child: const badges.Badge(
                    showBadge: false,
                    child: Icon(
                      Icons.notifications,
                      color: whiteColor,
                    ),
                  )),
            ),
          ),
        ],
        body: RefreshIndicator.adaptive(
          onRefresh: () async {
            await _refresh();
          },
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            children: const [
              CategorySelector(),
              SizedBox(
                height: 24,
              ),
              RecommendationList(),
              SizedBox(
                height: 24,
              ),
              EventList(),
            ],
          ),
        ),
      ),
    );
  }
}
