import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:rinjani_visitor/features/order/presentation/view_model/order_riverpod.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/features/product/presentation/view_model/product_detail.dart';
import 'package:rinjani_visitor/widget/add_on_widget.dart';
import 'package:rinjani_visitor/widget/button/primary_button.dart';
import 'package:rinjani_visitor/widget/date_picker_widget.dart';
import 'package:rinjani_visitor/widget/person_counter_widget.dart';
import 'package:rinjani_visitor/widget/rating_widget.dart';
import 'package:rinjani_visitor/widget/review_widget.dart';
import 'package:rinjani_visitor/widget/segmented_widget.dart';
import 'package:rinjani_visitor/widget/status.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final String id;

  const ProductDetailPage({super.key, required this.id});

  @override
  ConsumerState<ProductDetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<ProductDetailPage> {
  // TODO: override later with server data
  late final String id = widget.id;
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

  void _showModalPopup() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return PersonCounterWidget(
            controller: _personController,
            onSubmit: (value) {
              _state.person = int.parse(_personController.text);
              _viewModel.setDate(_dateController.text);
              _viewModel.submitOrder(
                  context, ref.read(productDetailViewModelProvider(id)).value!);
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    _state = ref.watch(orderViewModelProvider);
    final currentProduct = ref.watch(productDetailViewModelProvider(id));
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Detail Trip'),
        ),
        child: SafeArea(
          child: currentProduct.when(
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            loading: () => const Center(
              child: CupertinoActivityIndicator(),
            ),
            data: (data) => data == null
                ? const Center(
                    child: Text("Product not fount "),
                  )
                : CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            _Header(
                                title: data.title,
                                imgUrl: data.imgUrl,
                                location: data.location,
                                rating: data.rating,
                                rangePricing: data.rangePricing,
                                tripDuration: data.tripDuration),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: DetailSegmentedWidget(
                                description: KVDetailDescriptionWidget(
                                  kvChildren: [
                                    KVContentWidget(
                                        title: "Description",
                                        content: Text(
                                          data.description,
                                          style: blackTextStyle.copyWith(
                                            fontSize: body2,
                                          ),
                                        )),
                                    KVContentWidget(
                                        title: "AddOn",
                                        content: data.addOn.isNotEmpty
                                            ? Column(
                                                children: List.generate(
                                                    data.addOn.length, (index) {
                                                  final current =
                                                      data.addOn[index];
                                                  final currentSelected = _state
                                                      .addOn
                                                      .map((e) => e.id)
                                                      .contains(current.id);
                                                  return Tooltip(
                                                    message:
                                                        current.description ??
                                                            "",
                                                    child: AddOnWidget(
                                                      id: current.id,
                                                      name: current.name,
                                                      price: current.pricing,
                                                      selected: currentSelected,
                                                      onChanged:
                                                          (value, isSelected) {
                                                        if (isSelected) {
                                                          setState(() {
                                                            _viewModel
                                                                .removeAddon(
                                                                    current);
                                                          });
                                                          return;
                                                        }
                                                        setState(() {
                                                          _viewModel.addAddon(
                                                              current);
                                                        });
                                                      },
                                                    ),
                                                  );
                                                }),
                                              )
                                            : const Text(
                                                "Add On unavailable for this package")),
                                    KVContentWidget(
                                      title: "Date and Time",
                                      content: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DatePickerWidget(
                                            initialDate: _viewModel.getDate(),
                                            onChange: (dateVal) {
                                              _dateController.text =
                                                  dateVal ?? "";
                                              setState(() {
                                                _viewModel.setDate(dateVal);
                                              });
                                            },
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          TimeList(
                                              selectedTimeListData:
                                                  _state.time.toList(),
                                              timeListData: data.timeList24H,
                                              onTimeListTap:
                                                  (value, isSelected) {
                                                if (isSelected) {
                                                  _state.time.add(value);
                                                } else {
                                                  _state.time.remove(value);
                                                }
                                              }),
                                        ],
                                      ),
                                    ),
                                    KVContentWidget(
                                        title: "Accomodation",
                                        content: Text(
                                          data.accomodation,
                                          style: const TextStyle(fontSize: 16),
                                        )),
                                    const KVContentWidget(
                                        title: "Reviews",
                                        content: ReviewWidgetMock()),
                                    KVContentWidget(
                                      title: "Buy Product",
                                      content: PrimaryButton(
                                          onPressed: () => _showModalPopup(),
                                          child: Text(
                                            'Buy Product',
                                            style: whiteTextStyle.copyWith(
                                                fontSize: 16),
                                          )),
                                    )
                                  ],
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
          ),
        ));
  }
}

class _Header extends StatelessWidget {
  final String title;
  final String imgUrl;
  final String location;
  final String rating;
  final String rangePricing;
  final String tripDuration;
  const _Header(
      {super.key,
      required this.title,
      required this.imgUrl,
      required this.location,
      required this.rating,
      required this.rangePricing,
      required this.tripDuration});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 241,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(imgUrl))),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.6),
                      child: Tooltip(
                        message: title,
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: blackTextStyle.copyWith(
                              fontSize: 24, fontWeight: bold),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Status(
                      status: StatusColor.available,
                      text: "Available",
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
                        location,
                        overflow: TextOverflow.ellipsis,
                        style: grayTextStyle.copyWith(
                            fontSize: 16, fontWeight: medium),
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
                      rangePricing,
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semibold),
                    ),
                    const Spacer(),
                    const LikeButton()
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                RatingWidget(
                  rating: rating,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Trip duration: ${tripDuration}',
                  style: blackTextStyle.copyWith(fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
