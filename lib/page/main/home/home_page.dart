import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/constant/constant.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth_detail.dart';
import 'package:rinjani_visitor/features/booking/presentation/view_model/booking_list.dart';
import 'package:rinjani_visitor/features/product/presentation/view_model/recommended_product.dart';

import '_widget/category_selector.dart';
import '_widget/event_list.dart';
import '_widget/reccomendation.dart';
import '_widget/sliver_homeappbar_delegate.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> refresh() async {
      final _ = ref.refresh(bookingListViewModelProvider.notifier);
      ref.read(recommendedProductViewModelProvider.notifier).refresh();
      await Future.delayed(const Duration(seconds: 2));
    }

    final userDetail = ref.watch(authDetailViewModelProvider);
    final username = ref.watch(authViewModelProvider).value?.username ?? "User";
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: SliverHomeAppbarDelegate(
                  title: userDetail.asData?.value?.name ?? username,
                  leading: CachedNetworkImage(
                      imageUrl: userDetail.value?.profileImg ?? IMG_PLACEHOLDER,
                      imageBuilder: (context, imageProvider) {
                        return CircleAvatar(
                          backgroundImage: imageProvider,
                          radius: 20,
                        );
                      },
                      placeholder: (context, url) => const CircleAvatar(
                            backgroundColor: CupertinoColors.systemGrey4,
                            radius: 20,
                          ),
                      errorWidget: (context, url, error) => const CircleAvatar(
                            backgroundColor: CupertinoColors.systemGrey4,
                            radius: 20,
                          ))),
            ),
          ],
          body: RefreshIndicator.adaptive(
            onRefresh: () async {
              await refresh();
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
      ),
    );
  }
}
