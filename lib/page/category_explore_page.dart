import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/category_enum.dart';
import 'package:rinjani_visitor/features/product/presentation/view_model/product_view_model.dart';
import 'package:rinjani_visitor/features/product/presentation/view_model/search_view_model.dart';
import 'package:rinjani_visitor/page/booking/product_detail_page.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/product/big_card.dart';
import 'package:rinjani_visitor/widget/status.dart';

class CategoryExplorePage extends ConsumerStatefulWidget {
  final String title;
  final ProductCategory category;
  const CategoryExplorePage(
      {Key? key, required this.title, required this.category})
      : super(key: key);

  @override
  ConsumerState<CategoryExplorePage> createState() =>
      _CategoryExplorePageState();
}

class _CategoryExplorePageState extends ConsumerState<CategoryExplorePage> {
  @override
  Widget build(BuildContext context) {
    final _data = ref
        .read(searchViewModelProvider.notifier)
        .getProductByCategory(widget.category);
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: CupertinoNavigationBar(
          middle: Text('${widget.title}'),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _data.isNotEmpty
              ? ListView.builder(
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    final current = _data[index];
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
              : const Center(child: Text('Sorry, product not avaiable')),
        ));
  }
}
