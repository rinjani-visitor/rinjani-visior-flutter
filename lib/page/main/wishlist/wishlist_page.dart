import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/constant/constant.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/features/favorite/presentation/view_model/favorite_list.dart';
import 'package:rinjani_visitor/page/product/product_detail_page.dart';
import 'package:rinjani_visitor/core/presentation/widget/product/big_card.dart';
import 'package:rinjani_visitor/core/presentation/widget/status.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WishlistPage extends ConsumerStatefulWidget {
  const WishlistPage({super.key});

  @override
  ConsumerState<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends ConsumerState<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    final favoriteList = ref.watch(favoriteListViewModelProvider);
    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Favorites",
          style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      child: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: () async {
            final _ = ref.refresh(favoriteListViewModelProvider);
            await Future.delayed(const Duration(seconds: 1));
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: LIST_HORIZONTAL_PADDING),
            child: favoriteList.when(
              error: (error, _) {
                return LayoutBuilder(
                  builder: (context, constraints) => ListView(
                    children: [
                      Container(
                        constraints:
                            BoxConstraints(minHeight: constraints.maxHeight),
                        child: Center(
                          child: Text("${error.toString()}}"),
                        ),
                      )
                    ],
                  ),
                );
              },
              loading: () {
                return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (_, __) {
                      return const Skeletonizer(
                        child: BigProductCard(
                          imgUrl: IMG_PLACEHOLDER,
                          title: "",
                          status: StatusColor.init,
                          price: "",
                        ),
                      );
                    });
              },
              data: (data) {
                if (data == null || data.isEmpty) {
                  return LayoutBuilder(
                    builder: (context, constraints) => ListView(
                      children: [
                        Container(
                          constraints:
                              BoxConstraints(minHeight: constraints.maxHeight),
                          child: const Center(
                            child: Text("Favorite is empty"),
                          ),
                        )
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final current = data[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: BigProductCard(
                        onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ProductDetailPage(
                                  category: current.category ?? "",
                                  id: current.productId)),
                        ),
                        rating: current.ratingString,
                        imgUrl: current.thumbnail ?? IMG_PLACEHOLDER,
                        title: current.title ?? "No title",
                        status: current.avaiable != null && current.avaiable!
                            ? StatusColor.available
                            : StatusColor.error,
                        price: "${current.lowestPrice}\$",
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
