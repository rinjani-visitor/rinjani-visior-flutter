import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:rinjani_visitor/features/order/presentation/order_view_model.dart';
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
  const DetailPage({Key? key}) : super(key: key);

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  // TODO: override later with server data
  final ProductModel data = dataMock;

  late final _viewModel = ref.read(orderViewModelProvider.notifier);
  late var _state = ref.read(orderViewModelProvider);

  late final _dateController = TextEditingController(text: _state.date);
  late final _personController =
      TextEditingController(text: _state.person.toString());

  void _onSubmit(int personValue) {
    _state.person = int.tryParse(_personController.text);
    _viewModel.setDate(_dateController.text);
    Navigator.pushNamed(context, "/booking-detail-page");
  }

  void _showModalPopup() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return PersonCounterWidget(
            controller: _personController,
            onSubmit: (value) {
              _onSubmit(value);
            },
          );
        });
  }

  // Page Part
  Widget heroImage() {
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
              const Spacer(),
              const Status(
                status: StatusColor.available,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Icon(
                Icons.location_pin,
                color: lightGray,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                data.location,
                style: grayTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                data.rangePricing,
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
              ),
              const Spacer(),
              const LikeButton()
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const RatingWidget(),
          const SizedBox(
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
    _state = ref.watch(orderViewModelProvider);
    final orderData = _state;
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
                    heroImage(),
                    header(),
                    DetailSegmentedWidget(
                      description: DetailDescriptionWidget(
                        description: data.description,
                        accomodation: data.accomodation,
                        addOn: const AddOnWidgetMock(),
                        datePicker: DatePickerWidget(
                          initialDate: _viewModel.getDate(),
                          onChange: (dateVal) {
                            _dateController.text = dateVal ?? "";
                            _viewModel.setDate(dateVal);
                          },
                        ),
                        timeList: TimeList(
                            initialSelectedTimeListData:
                                orderData.time.toList(),
                            timeListData: data.timeList24H,
                            onTimeListTap: (value, isSelected) {
                              if (isSelected) {
                                _state.time.add(value);
                              } else {
                                orderData.time.remove(value);
                              }
                            }),
                        review: const ReviewWidget(),
                        buyProduct: PrimaryButton(
                            onPressed: () => _showModalPopup(),
                            child: Text(
                              'Buy Product',
                              style: whiteTextStyle.copyWith(fontSize: 16),
                            )),
                      ),
                      initenary: DetailIniteraryWidget(
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
