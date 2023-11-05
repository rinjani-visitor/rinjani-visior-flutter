import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:rinjani_visitor/core/constant/product_package.dart';
import 'package:rinjani_visitor/features/order/presentation/order_view_model.dart';
import 'package:rinjani_visitor/features/product/domain/addon_model.dart';
import 'package:rinjani_visitor/features/product/domain/product_model.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/add_on_widget.dart';
import 'package:rinjani_visitor/widget/button/primary_button.dart';
import 'package:rinjani_visitor/widget/date_picker_widget.dart';
import 'package:rinjani_visitor/widget/person_counter_widget.dart';
import 'package:rinjani_visitor/widget/rating_widget.dart';
import 'package:rinjani_visitor/widget/review_card_widget.dart';
import 'package:rinjani_visitor/widget/review_widget.dart';
import 'package:rinjani_visitor/widget/segmented_widget.dart';
import 'package:rinjani_visitor/widget/status.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final ProductModel data;
  const ProductDetailPage({Key? key, required this.data}) : super(key: key);

  @override
  ConsumerState<ProductDetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<ProductDetailPage> {
  // TODO: override later with server data
  late final ProductModel data = widget.data;

  late final _viewModel = ref.read(orderViewModelProvider.notifier);
  late var _state = ref.read(orderViewModelProvider);

  late final _dateController = TextEditingController(text: _state.date);
  late final _personController =
      TextEditingController(text: _state.person.toString());

  @override
  void initState() {
    super.initState();

    debugPrint(_state.toString());
  }

  void _onSubmit(int personValue) {
    _state.product = data;
    _state.person = int.parse(_personController.text);
    _viewModel.setDate(_dateController.text);
    Navigator.pushNamed(context, "/booking-detail");
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
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(data.imgUrl))),
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
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6),
                child: Tooltip(
                  message: data.title,
                  child: Text(
                    data.title,
                    overflow: TextOverflow.ellipsis,
                    style:
                        blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
                  ),
                ),
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
              Flexible(
                child: Text(
                  data.location,
                  overflow: TextOverflow.ellipsis,
                  style:
                      grayTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
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
          RatingWidget(
            rating: data.rating,
          ),
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
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    heroImage(),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: header()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: DetailSegmentedWidget(
                        description: DetailDescriptionWidget(
                          description: data.description,
                          accomodation: data.accomodation,
                          addOn: List.generate(data.addOn.length, (index) {
                            final current = data.addOn[index];
                            return Tooltip(
                              message: current.description ?? "",
                              child: AddOnWidget(
                                name: current.name,
                                price: current.pricing,
                                selected: _state.addOn
                                    .map((e) => e.id)
                                    .contains(current.id),
                                onChanged: (value) {
                                  if (_state.addOn
                                      .map((e) => e.id)
                                      .contains(current.id)) {
                                    setState(() {
                                      _viewModel.removeAddon(current);
                                    });
                                    return;
                                  } else {
                                    setState(() {
                                      _viewModel.addAddon(current);
                                    });
                                  }
                                },
                              ),
                            );
                          }),
                          datePicker: DatePickerWidget(
                            initialDate: _viewModel.getDate(),
                            onChange: (dateVal) {
                              _dateController.text = dateVal ?? "";
                              setState(() {
                                _viewModel.setDate(dateVal);
                              });
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
                          review: ReviewWidget(
                            reviewChildren: [
                              ReviewCardWidget(
                                  name: "Kevin",
                                  createdTime: " weeks ago",
                                  message: "This place is amazing, I love it"),
                              ReviewCardWidget(
                                  name: "Kevin",
                                  createdTime: " weeks ago",
                                  message: "This place is amazing, I love it"),
                            ],
                          ),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
