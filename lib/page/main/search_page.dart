import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/constant/constant.dart';
import 'package:rinjani_visitor/features/product/presentation/view_model/search.dart';
import 'package:rinjani_visitor/page/product/product_detail_page.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/widget/product/big_card.dart';
import 'package:rinjani_visitor/core/widget/status.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final searchData = ref.watch(productSearchViewModelProvider);
    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        padding: const EdgeInsetsDirectional.only(bottom: 2, top: 2),
        middle: CupertinoSearchTextField(
          onSubmitted: (text) {
            ref
                .read(productSearchViewModelProvider.notifier)
                .searchPackage(text);
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: searchData.when(
            data: (data) => data.isNotEmpty
                ? ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final curr = data[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: BigProductCard(
                            image: CachedNetworkImageProvider(
                                curr.thumbnail ?? IMG_PLACEHOLDER),
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
                : const Center(
                    child: Text("Data not found"),
                  ),
            error: (error, stackTrace) => Center(
                  child: Text("Error occured: $error"),
                ),
            loading: () => ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const Skeletonizer(
                      ignoreContainers: true,
                      child: BigProductCard(
                          image: AssetImage("assets/wise-logo.png"),
                          title: "",
                          status: StatusColor.available,
                          price: "0\$")),
                )),
      ),
    );
  }
}
