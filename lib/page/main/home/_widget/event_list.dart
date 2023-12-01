import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/constant/constant.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/widget/product/big_card.dart';
import 'package:rinjani_visitor/core/widget/status.dart';

class EventList extends ConsumerWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
