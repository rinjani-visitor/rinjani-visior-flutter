import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/exception/exception.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/features/product/presentation/view_model/recommended_product.dart';
import 'package:rinjani_visitor/page/product/product_detail_page.dart';
import 'package:rinjani_visitor/widget/product/small_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecommendationList extends ConsumerWidget {
  const RecommendationList({super.key});

  void _toProductDetail(BuildContext context, String category, String id) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => ProductDetailPage(
                  id: id,
                  category: category,
                )));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommendedData = ref.watch(recommendedProductViewModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16),
          child: Text(
            'Recommeded',
            style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // fixed horizontal list, source: https://gist.github.com/Abushawish/048acfdaf956640ea6fa8b3991dbbd81
        recommendedData.when(
          data: (data) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(data.length, (index) {
                  final current = data[index];
                  return SmallProductCard(
                      onTap: () => _toProductDetail(
                          context, current.category ?? "", current.productId),
                      title: current.title ?? "No title found",
                      rating: current.ratingString,
                      imageUrl: current.thumbnail);
                }),
              ),
            );
          },
          error: (error, stackTrace) {
            if (error is ExtException) {
              return Center(child: Text("${error.errorMessage}"));
            }
            return Center(child: Text("error ${error}"));
          },
          loading: () => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Skeletonizer(
              enabled: true,
              child: Row(
                children: List.generate(3, (index) {
                  return const SmallProductCard(
                    title: "Placeholder",
                    loading: true,
                  );
                }),
              ),
            ),
          ),
        )
      ],
    );
  }
}
