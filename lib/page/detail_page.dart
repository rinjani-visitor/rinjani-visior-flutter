import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:rinjani_visitor/features/product/domain/product_model.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/add_on_widget.dart';
import 'package:rinjani_visitor/widget/date_picker_widget.dart';
import 'package:rinjani_visitor/widget/rating_widget.dart';
import 'package:rinjani_visitor/widget/review_widget.dart';
import 'package:rinjani_visitor/widget/segmented_widget.dart';
import 'package:rinjani_visitor/widget/status.dart';

const dataMock = ProductModel(
    packageId: "thisispackageid",
    title: "Rinjani Trip",
    location: "Lombok Utara, Indonesia",
    locationUrl: "",
    imgUrl: "",
    rangePricing: "10\$ - 20\$/person",
    rating: "4.9",
    tripDuration: "2 days, 1 night",
    description: "Basic package",
    accomodation: "accomodation",
    addOnIds: [""],
    reviewIds: [""],
    avaiabilityStatus: "avaiable",
    initenaryList: ["08.00 - Wake up"],
    reviewCount: 32,
    timeList24H: ["08.00", "12.00", "15.00", "18.00"]);

class DetailPage extends ConsumerStatefulWidget {
  DetailPage({Key? key}) : super(key: key);

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  // TODO: override later
  final ProductModel data = dataMock;
  final listData = ["08.00", "12.00"];

  Widget imageContainer() {
    return Container(
      width: double.infinity,
      height: 241,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/rinjani.jpeg'))),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                data.title,
                style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
              ),
              Spacer(),
              Status(
                status: StatusColor.available,
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Icon(
                Icons.location_pin,
                color: lightGray,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                data.location,
                style: grayTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                data.rangePricing,
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
              ),
              Spacer(),
              LikeButton()
            ],
          ),
          SizedBox(
            height: 8,
          ),
          RatingWidget(),
          SizedBox(
            height: 8,
          ),
          Text(
            'Trip duration: ${data.tripDuration}',
            style: blackTextStyle.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Detail Trip'),
        ),
        child: CustomScrollView(

          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    imageContainer(),
                    header(),
                    DetailSegmentedWidget(
                      descriptionWidget: DetailDescriptionWidget(
                          accomodation: data.accomodation,
                          description: data.description,
                          datePickerWidget: DatePickerWidget(),
                          timeListFormat24H: data.timeList24H,
                          reviewWidget: ReviewWidget(),
                          addOnWidget: AddOnWidgetMock()
                      ),
                      initenaryWidget: DetailIniteraryWidget(
                          initenaryList: data.initenaryList),
                    ),
                  ],
                ),
              ),
            ),

          ],

        ));
  }
}
