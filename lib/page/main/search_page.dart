import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/constant/constant.dart';
import 'package:rinjani_visitor/features/product/presentation/view_model/search.dart';
import 'package:rinjani_visitor/page/product/product_detail_page.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/presentation/widget/product/big_card.dart';
import 'package:rinjani_visitor/core/presentation/widget/status.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchData = ref.watch(productSearchViewModelProvider);
    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      navigationBar: CupertinoNavigationBar(
        padding: const EdgeInsetsDirectional.only(bottom: 2, top: 2),
        middle: CupertinoSearchTextField(
          onSubmitted: (text) {
            searchController.text = text;
            ref
                .read(productSearchViewModelProvider.notifier)
                .searchPackage(text);
          },
        ),
      ),
      child: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: () async {
            await ref
                .read(productSearchViewModelProvider.notifier)
                .searchPackage(searchController.text);
          },
          child: Padding(
            padding: const EdgeInsets.only(
                left: LIST_HORIZONTAL_PADDING,
                right: LIST_HORIZONTAL_PADDING,
                top: 8.0),
            child: searchData.when(
              data: (data) => data.isNotEmpty
                  ? ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final curr = data[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: BigProductCard(
                              imgUrl: curr.thumbnail ?? IMG_PLACEHOLDER,
                              title: curr.title ?? "Title not found",
                              status: curr.avaiable != null && curr.avaiable!
                                  ? StatusColor.available
                                  : StatusColor.error,
                              rating: curr.ratingString,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => ProductDetailPage(
                                              category: curr.category ?? "",
                                              id: curr.productId,
                                            )));
                              },
                              price: "${curr.lowestPrice}\$"),
                        );
                      },
                    )
                  : LayoutBuilder(
                      builder: (context, constraints) => ListView(
                        children: [
                          Container(
                            constraints: BoxConstraints(
                                minHeight: constraints.maxHeight),
                            child: Center(
                              child: Text("No product found"),
                            ),
                          )
                        ],
                      ),
                    ),
              error: (error, stackTrace) => LayoutBuilder(
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
              ),
              loading: () => ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => const Skeletonizer(
                    ignoreContainers: true,
                    child: BigProductCard(
                        imgUrl: IMG_PLACEHOLDER,
                        title: "",
                        status: StatusColor.available,
                        price: "0\$")),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
