import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:rinjani_visitor/features/order/presentation/order_riverpod.dart';
import 'package:rinjani_visitor/features/product/domain/product_model.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/add_on_widget.dart';
import 'package:rinjani_visitor/widget/button/primary_button.dart';
import 'package:rinjani_visitor/widget/date_picker_widget.dart';
import 'package:rinjani_visitor/widget/person_counter_widget.dart';
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
    accomodation: "self driving, etc is provided by buying this package",
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

  final _dateController = TextEditingController();

  void _onSubmit(int personValue) {
    ref.read(orderRiverpodProvider).person = personValue;
    ref.read(orderRiverpodProvider.notifier).setDate(_dateController.text);
    Navigator.pushNamed(context,
        "/booking-detail-page");
  }

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
        navigationBar: const CupertinoNavigationBar(
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
                          buyProductWidget: PrimaryButton(
                              onPressed: () {
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        width: double.infinity,
                                        height: 300,
                                        decoration: BoxDecoration(
                                            color: whiteColor,
                                            borderRadius: BorderRadius.circular(
                                                bigRadius)),
                                        child: PersonCounterWidget(
                                          onSubmit: (value) {
                                            _onSubmit(value);
                                          },
                                        ),
                                      );
                                    });
                              },
                              child: Text(
                                'Buy Product',
                                style: whiteTextStyle.copyWith(fontSize: 16),
                              )),
                          accomodation: data.accomodation,
                          description: data.description,
                          datePickerWidget: DatePickerWidget(
                            onChange: (dateVal) {
                              _dateController.text = dateVal ?? "";
                            },
                          ),
                          timeListFormat24H: data.timeList24H,
                          currentSelectedTimeList: ref.read(orderRiverpodProvider).time.toList(),
                          onTimeListTap: (value, isSelected) {
                            if(isSelected) {
                              ref.read(orderRiverpodProvider).time.add(value);
                            }else {
                              ref.read(orderRiverpodProvider).time.remove(value);
                            }
                          },
                          reviewWidget: ReviewWidget(),
                          addOnWidget: AddOnWidgetMock()),
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
