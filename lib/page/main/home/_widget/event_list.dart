import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/constant/constant.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/presentation/widget/product/big_card.dart';
import 'package:rinjani_visitor/core/presentation/widget/status.dart';
import 'package:rinjani_visitor/features/product/presentation/view_model/event.dart';

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
                        imgUrl: IMG_PLACEHOLDER,
                        title: value[index].title ?? "",
                        price: "\$80 - \$90 - Person",
                        status: StatusColor.available,
                        onTap: () {
                          Navigator.pushNamed(context, "/event/detail");
                        },
                        rating: value[index].ratingString),
                  );
                },
              ),
            _ => const Center(child: CupertinoActivityIndicator()),
          },
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
                child: BigProductCard(
                    imgUrl: IMG_PLACEHOLDER,
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
}
