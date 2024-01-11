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

const List<String> categoryList = [
  "all",
  "homestay",
  "event",
  "rinjani",
  "culture",
  "landscape",
];

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final searchController = TextEditingController();
  String searchQuery = "";
  String? category;
  bool avaiable = true;
  int? rating;

  void _showDialog() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "filter",
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: StatefulBuilder(
            builder: (context, setState) => Container(
              height: MediaQuery.of(context).size.height * 0.5,
              padding: EdgeInsets.all(24),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(12)),
              child: SizedBox.expand(
                child: Column(children: [
                  Text("Filter",
                      style: blackTextStyle.copyWith(
                          fontSize: heading4, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text("Avaiable: ",
                          style: blackTextStyle.copyWith(
                            fontSize: body1,
                          )),
                      Spacer(),
                      CupertinoSwitch(
                        value: avaiable,
                        onChanged: (value) {
                          setState(() {
                            avaiable = value;
                          });
                          ref
                              .read(productSearchViewModelProvider.notifier)
                              .searchPackage(
                                searchController.text,
                                category: category == "all" ? null : category,
                                avaiable: avaiable,
                                rating: rating,
                              );
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("Category: ",
                          style: blackTextStyle.copyWith(
                            fontSize: body1,
                          )),
                      Spacer(),
                      GestureDetector(
                          child: Row(
                            children: [
                              Text(category ?? "all",
                                  style: greenTextStyle.copyWith(
                                    fontSize: body1,
                                  )),
                              const SizedBox(width: 8.0),
                              Icon(CupertinoIcons.chevron_down, size: 16)
                            ],
                          ),
                          onTap: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 200,
                                  padding: EdgeInsets.only(top: 6.0),
                                  color: CupertinoColors.systemBackground
                                      .resolveFrom(context),
                                  child: CupertinoPicker(
                                    itemExtent: 32.0,
                                    scrollController:
                                        FixedExtentScrollController(
                                      initialItem: categoryList
                                          .indexOf(category ?? categoryList[0]),
                                    ),
                                    onSelectedItemChanged: (value) {
                                      setState(() {
                                        category = categoryList[value];
                                      });
                                    },
                                    children: List.generate(
                                      categoryList.length,
                                      (index) => Center(
                                        child: Text(categoryList[index]),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => ref
                                .read(productSearchViewModelProvider.notifier)
                                .searchPackage(
                                  searchController.text,
                                  category: category == "all" ? null : category,
                                  avaiable: avaiable,
                                  rating: rating,
                                ));
                          })
                    ],
                  ),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final searchData = ref.watch(productSearchViewModelProvider);
    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      navigationBar: CupertinoNavigationBar(
        padding: const EdgeInsetsDirectional.only(bottom: 2, top: 2),
        middle: CupertinoSearchTextField(
          controller: searchController,
          onSubmitted: (text) {
            searchController.text = text;
            ref
                .read(productSearchViewModelProvider.notifier)
                .searchPackage(text);
          },
        ),
        trailing: GestureDetector(
          child: const Icon(Icons.more_vert),
          onTap: () => _showDialog(),
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
                              statusName:
                                  curr.avaiable != null && curr.avaiable!
                                      ? StatusColor.available.name
                                      : "Not available",
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
                            child: const Center(
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
                        child: Text(error.toString()),
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
