import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/exception/exception.dart';
import 'package:rinjani_visitor/features/product/presentation/view_model/category.dart';
import 'package:rinjani_visitor/page/product/product_detail_page.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/widget/product/big_card.dart';
import 'package:rinjani_visitor/widget/status.dart';
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
        child: RefreshIndicator.adaptive(
          onRefresh: () async {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: state.when(
              data: (filteredData) {
                return filteredData != null && filteredData.isNotEmpty
                    ? ListView.builder(
                        itemCount: filteredData.length,
                        itemBuilder: (context, index) {
                          final current = filteredData[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: BigProductCard(
                                image: NetworkImage(current.thumbnail ?? ""),
                                title: current.title ?? "No title found",
                                rating: current.rating.toString(),
                                status: StatusColor.available,
                                onTap: () => _pushToDetail(
                                    current.category ?? "rinjani",
                                    current.productId),
                                price: "${current.lowestPrice.toString()}\$"),
                          );
                        },
                      )
                    : const Center(child: Text('Sorry, product not avaiable'));
              },
              error: (error, stackTrace) {
                if (error is ExtException) {
                  return Center(
                    child: Text("${error.errorMessage}"),
                  );
                }
                return Center(
                  child: Text(error.toString()),
                );
              },
              loading: () {
                return Skeletonizer(
                  ignoreContainers: true,
                  child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: BigProductCard(
                            image: AssetImage("assets/logo.png"),
                            title: " ",
                            status: StatusColor.available,
                            price: "23123"),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ));
  }
}
