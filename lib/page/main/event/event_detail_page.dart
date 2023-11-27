import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/presentation/utils/internationalization.dart';
import 'package:rinjani_visitor/features/event/domain/entity/event.dart';
import 'package:rinjani_visitor/page/product/product_detail_page.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/widget/product/big_card.dart';
import 'package:rinjani_visitor/core/widget/status.dart';

// mock data about lombok festival
final mockdata = EventEntity(
    name: "Lombok Festival",
    imgUrl: "assets/rinjani.jpeg",
    date: DateTime.now(),
    description: "",
    products: []);

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({super.key});

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  final data = mockdata;

  Widget imageContainer() {
    return Container(
      width: double.infinity,
      height: 241,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/event.jpeg'))),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rinjani Trip',
            style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
          )
        ],
      ),
    );
  }

  Widget eventHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: whiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.name,
            style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: lightGray,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    dateFormat.format(data.date),
                    style: grayTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: lightGray,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    timeFormat.format(data.date),
                    style: grayTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex',
            style: blackTextStyle.copyWith(fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget availableTrip() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Availabe Trip',
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.products.length,
            itemBuilder: (context, index) {
              final current = data.products[index];
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: BigProductCard(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ProductDetailPage(
                                    id: current.id,
                                    category: current.category ?? "",
                                  )));
                    },
                    image: NetworkImage(current.thumbnail ?? ""),
                    title: current.title ?? "No title found",
                    price: current.rangePricing,
                    status: StatusColor.available,
                    rating: current.rating),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Event detail'),
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [imageContainer(), eventHeader(), availableTrip()],
        ));
  }
}
