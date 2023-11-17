import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/widget/home/delegate/sliver_homeappbar_delegate.dart';
import 'package:rinjani_visitor/features/authentication/presentation/auth_riverpod.dart';
import 'package:rinjani_visitor/features/product/domain/category_enum.dart';
import 'package:rinjani_visitor/features/product/presentation/view_model/recommended_product_riverpod.dart';
import 'package:rinjani_visitor/page/product/product_detail_page.dart';
import 'package:rinjani_visitor/page/category_explore_page.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/widget/product/big_card.dart';
import 'package:rinjani_visitor/widget/category_item.dart';
import 'package:rinjani_visitor/widget/product/small_card.dart';
import 'package:rinjani_visitor/widget/status.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  Widget _categoriesWidgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryItem(
                label: 'Rinjani',
                iconName: Icons.landscape,
                onTap: (label) {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => CategoryExplorePage(
                                title: label,
                                category: ProductCategory.rinjani,
                              )));
                },
              ),
              CategoryItem(
                label: 'Home Stay',
                iconName: Icons.hotel,
                onTap: (label) {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => CategoryExplorePage(
                                title: label,
                                category: ProductCategory.homeStay,
                              )));
                },
              ),
              CategoryItem(
                label: 'Culture',
                iconName: Icons.self_improvement,
                onTap: (label) {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => CategoryExplorePage(
                                title: label,
                                category: ProductCategory.culture,
                              )));
                },
              ),
              CategoryItem(
                label: 'Landscape',
                iconName: Icons.hiking,
                onTap: (label) {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => CategoryExplorePage(
                                title: label,
                                category: ProductCategory.landscape,
                              )));
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _recommendedWidgets() {
    final recommendedData = ref.watch(recommendedProductRiverpodProvider);

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
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => ProductDetailPage(
                                      data: current,
                                    )));
                      },
                      title: current.title,
                      rating: current.rating,
                      image: AssetImage(current.imgUrl));
                }),
              ),
            );
          },
          error: (error, stackTrace) {
            return Text("error $error");
          },
          loading: () {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Skeletonizer(
                enabled: true,
                child: Row(
                  children: List.generate(3, (index) {
                    return const SmallProductCard(
                        title: "Placeholder",
                        image: AssetImage('assets/rinjani.jpeg'));
                  }),
                ),
              ),
            );
          },
        )
      ],
    );
  }

  Widget _rinjaniTripWidgets() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Upcoming Event',
              style:
                  blackTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          // TODO: update this with new repository structure

          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
                child: BigProductCard(
                    image: const AssetImage("assets/event.jpeg"),
                    title: "Lombok Festival",
                    price: "\$80 - \$90 - Person",
                    status: StatusColor.available,
                    onTap: () {
                      Navigator.pushNamed(context, "/event/detail");
                    },
                    rating: "4.9"),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final username = ref.watch(authRiverpodProvider).value?.username ?? "User";
    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverPersistentHeader(
            floating: true,
            pinned: true,
            delegate: SliverHomeAppbarDelegate(title: username),
          ),
        ],
        body: RefreshIndicator.adaptive(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 2));
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                _categoriesWidgets(),
                const SizedBox(
                  height: 24,
                ),
                _recommendedWidgets(),
                const SizedBox(
                  height: 24,
                ),
                _rinjaniTripWidgets(),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
