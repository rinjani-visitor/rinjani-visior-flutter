import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/product/domain/category_enum.dart';
import 'package:rinjani_visitor/features/product/presentation/view_model/search_riverpod.dart';
import 'package:rinjani_visitor/page/booking/product_detail_page.dart';
import 'package:rinjani_visitor/core/theme/theme.dart';
import 'package:rinjani_visitor/widget/product/big_card.dart';
import 'package:rinjani_visitor/widget/status.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryExplorePage extends ConsumerStatefulWidget {
  final String title;
  final ProductCategory category;
  const CategoryExplorePage(
      {super.key, required this.title, required this.category});

  @override
  ConsumerState<CategoryExplorePage> createState() =>
      _CategoryExplorePageState();
}

class _CategoryExplorePageState extends ConsumerState<CategoryExplorePage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchRiverpodProvider);
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: CupertinoNavigationBar(
          middle: Text(widget.title),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: state.when(
            data: (data) {
              final filteredData = data
                  .where((element) => element.category == widget.category)
                  .toList();
              return filteredData.isNotEmpty
                  ? ListView.builder(
                      itemCount: filteredData.length,
                      itemBuilder: (context, index) {
                        final current = filteredData[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: BigProductCard(
                              image: AssetImage(current.imgUrl),
                              title: current.title,
                              rating: current.rating,
                              status: StatusColor.available,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => ProductDetailPage(
                                              data: current,
                                            )));
                              },
                              price: current.rangePricing),
                        );
                      },
                    )
                  : const Center(child: Text('Sorry, product not avaiable'));
            },
            error: (error, stackTrace) {
              return Center(
                child: Text(error.toString()),
              );
            },
            loading: () {
              return Skeletonizer(
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
        ));
  }
}
