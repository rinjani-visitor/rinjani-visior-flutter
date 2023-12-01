import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/constant/constant.dart';
import 'package:rinjani_visitor/core/exception/exception.dart';
import 'package:rinjani_visitor/features/product/presentation/view_model/category.dart';
import 'package:rinjani_visitor/page/product/product_detail_page.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/widget/product/big_card.dart';
import 'package:rinjani_visitor/core/widget/status.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryExplorePage extends ConsumerStatefulWidget {
  final String title;
  final String category;
  const CategoryExplorePage(
      {super.key, required this.title, required this.category});

  @override
  ConsumerState<CategoryExplorePage> createState() =>
      _CategoryExplorePageState();
}

class _CategoryExplorePageState extends ConsumerState<CategoryExplorePage> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref
          .read(productCategoryViewModelProvider.notifier)
          .getProductCategory(widget.category);
    });
  }

  void _pushToDetail(String category, String id) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => ProductDetailPage(
                  category: category,
                  id: id,
                )));
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productCategoryViewModelProvider);
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: CupertinoNavigationBar(
          middle: Text(widget.title),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: RefreshIndicator.adaptive(
              onRefresh: () async {
                await ref
                    .read(productCategoryViewModelProvider.notifier)
                    .getProductCategory(widget.category);
              },
              child: state.when(
                data: (filteredData) {
                  if (filteredData != null && filteredData.isNotEmpty) {
                    return ListView.builder(
                      itemCount: filteredData.length,
                      itemBuilder: (context, index) {
                        final current = filteredData[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: BigProductCard(
                              imgUrl: current.thumbnail ?? "",
                              title: current.title ?? "No title found",
                              rating: current.rating.toString(),
                              status: StatusColor.available,
                              onTap: () => _pushToDetail(
                                  current.category ?? "rinjani",
                                  current.productId),
                              price: "${current.lowestPrice.toString()}\$"),
                        );
                      },
                    );
                  }
                  return LayoutBuilder(
                    builder: (context, constraints) => ListView(
                      children: [
                        Container(
                          constraints:
                              BoxConstraints(minHeight: constraints.maxHeight),
                          child: const Center(
                            child: Text("Product is empty"),
                          ),
                        )
                      ],
                    ),
                  );
                },
                error: (error, stackTrace) {
                  return LayoutBuilder(
                    builder: (context, constraints) => ListView(
                      children: [
                        Container(
                          constraints:
                              BoxConstraints(minHeight: constraints.maxHeight),
                          child: Center(
                            child: Text("${error.toString()}"),
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
                    },
                  );
                },
              ),
            ),
          ),
        ));
  }
}
