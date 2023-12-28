import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/constant/constant.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/presentation/widget/product/big_card.dart';
import 'package:rinjani_visitor/core/presentation/widget/status.dart';
import 'package:rinjani_visitor/features/product/presentation/view_model/event.dart';
import 'package:rinjani_visitor/page/product/product_detail_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EventList extends ConsumerStatefulWidget {
  const EventList({super.key});

  @override
  ConsumerState<EventList> createState() => _EventListState();
}

class _EventListState extends ConsumerState<EventList>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(eventViewModelProvider);

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
          switch (data) {
            AsyncError(:final error) => Center(child: Text(error.toString())),
            AsyncData(:final value) => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8, left: 16, right: 16),
                    child: BigProductCard(
                        imgUrl: value[index].thumbnail ?? IMG_PLACEHOLDER,
                        title: value[index].title ?? "",
                        price: "from ${value[index].lowestPrice}\$",
                        statusName: (value[index].avaiable ?? false)
                            ? "Available"
                            : "Not Available",
                        status: (value[index].avaiable ?? false)
                            ? StatusColor.available
                            : StatusColor.error,
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => ProductDetailPage(
                                id: value[index].productId,
                                category: "event",
                              ),
                            ),
                          );
                        },
                        rating: value[index].ratingString),
                  );
                },
              ),
            _ => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8, left: 16, right: 16),
                    child: Skeletonizer(
                      child: BigProductCard(
                          imgUrl: IMG_PLACEHOLDER,
                          title: "Lombok Festival",
                          price: "\$80 - \$90 - Person",
                          status: StatusColor.available,
                          onTap: () {
                            Navigator.pushNamed(context, "/event/detail");
                          },
                          rating: "4.9"),
                    ),
                  );
                },
              ),
          },
        ],
      ),
    );
  }
}
