import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:rinjani_visitor/core/presentation/utils/internationalization.dart';
import 'package:rinjani_visitor/features/booking/presentation/view_model/booking.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';
import 'package:rinjani_visitor/features/product/presentation/view_model/product_detail.dart';
import 'package:rinjani_visitor/widget/add_on_widget.dart';
import 'package:rinjani_visitor/widget/button/primary_button.dart';
import 'package:rinjani_visitor/widget/date_picker_widget.dart';
import 'package:rinjani_visitor/widget/input_field.dart';
import 'package:rinjani_visitor/widget/person_counter_widget.dart';
import 'package:rinjani_visitor/widget/rating_widget.dart';
import 'package:rinjani_visitor/widget/review_widget.dart';
import 'package:rinjani_visitor/widget/segmented_widget.dart';
import 'package:rinjani_visitor/widget/status.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final String id;
  final String category;

  const ProductDetailPage(
      {super.key, required this.category, required this.id});

  @override
  ConsumerState<ProductDetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<ProductDetailPage> {
  late var bookingState = ref.read(bookingViewModelProvider);
  BookingViewModel get bookingNotifier =>
      ref.read(bookingViewModelProvider.notifier);

  late final _startDateController = TextEditingController(
      text: dateFormat.format(DateTime.parse(bookingState.startDateTime)));
  late final _personController =
      TextEditingController(text: bookingState.totalPersons.toString());

  @override
  void initState() {
    super.initState();
    Future(() =>
        ref.read(productDetailViewModelProvider.notifier).getProductDetail(
              widget.category,
              widget.id,
            ));

    debugPrint(bookingState.toString());
  }

  void _onSubmit(ProductDetailEntity data) {
    bookingNotifier.submitOrder(context, data);
  }

  void _showDatePicker(bool rangeDate) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Material(
          color: CupertinoColors.white,
          surfaceTintColor: CupertinoColors.white,
          child: Container(
            height: 400,
            padding: const EdgeInsets.all(16),
            child: SfDateRangePicker(
              minDate: DateTime.now(),
              selectionColor: primaryColor,
              startRangeSelectionColor: primaryColor,
              endRangeSelectionColor: primaryColor,
              rangeSelectionColor: accentPrimaryColor,
              initialDisplayDate: bookingState.startDateTime.isNotEmpty
                  ? DateTime.parse(bookingState.startDateTime)
                  : DateTime.now(),
              initialSelectedRange: rangeDate
                  ? PickerDateRange(
                      bookingState.startDateTime.isNotEmpty
                          ? DateTime.parse(bookingState.startDateTime)
                          : DateTime.now(),
                      bookingState.endDateTime.isNotEmpty
                          ? DateTime.parse(bookingState.endDateTime)
                          : DateTime.now(),
                    )
                  : null,
              monthViewSettings: DateRangePickerMonthViewSettings(
                viewHeaderStyle: DateRangePickerViewHeaderStyle(
                    textStyle: blackTextStyle.copyWith(
                      fontSize: heading5,
                      fontWeight: semibold,
                    ),
                    backgroundColor: CupertinoColors.white),
              ),
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                final date = args.value;
                if (date is DateTime) {
                  final localizedDate = dateFormat.format(date);
                  bookingState.startDateTime = date.toString();
                  _startDateController.text = localizedDate;
                } else if (date is PickerDateRange) {
                  final localizedStartDate =
                      dateFormat.format(date.startDate ?? DateTime.now());
                  final localizedEndDate = date.endDate != null
                      ? dateFormat.format(date.endDate!)
                      : "";
                  bookingState.startDateTime = date.startDate.toString();
                  bookingState.endDateTime = date.endDate.toString();
                  _startDateController.text =
                      "${localizedStartDate.toString()} - ${localizedEndDate.toString()}";
                }
              },
              selectionMode: rangeDate
                  ? DateRangePickerSelectionMode.range
                  : DateRangePickerSelectionMode.single,
            ),
          ),
        );
      },
    );
  }

  void _showPersonSelector(ProductDetailEntity data) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return PersonCounterWidget(
            controller: _personController,
            onSubmit: (value) {
              bookingState.totalPersons = _personController.text;
              _onSubmit(data);
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    bookingState = ref.watch(bookingViewModelProvider);
    final currentProduct = ref.watch(productDetailViewModelProvider);

    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Detail Trip'),
        ),
        child: SafeArea(
          child: RefreshIndicator.adaptive(
            onRefresh: () async {
              await ref
                  .read(productDetailViewModelProvider.notifier)
                  .getProductDetail(
                    widget.category,
                    widget.id,
                  );
              await Future.delayed(const Duration(seconds: 1));
            },
            child: currentProduct.when(
              error: (error, stackTrace) => Center(
                child: Text(error.toString()),
              ),
              loading: () => const Center(
                child: CupertinoActivityIndicator(),
              ),
              data: (data) => data == null
                  ? const Column(
                      children: [Text("Product not found")],
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          _Header(
                            title: data.title ?? "Title not found",
                            imgUrl: data.thumbnail ?? "",
                            location: data.location ?? "",
                            rating: data.rating ?? "-.-",
                            avaiable: data.status ?? false,
                            rangePricing: data.rangePricing,
                            tripDuration: data.tripDuration ?? "N/a",
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: DetailSegmentedWidget(
                              description: KVDetailDescriptionWidget(
                                kvChildren: [
                                  KVContentWidget(
                                    title: "Description",
                                    content: Text(
                                      data.description ??
                                          "No description provided",
                                      style: blackTextStyle.copyWith(
                                        fontSize: body1,
                                      ),
                                    ),
                                  ),
                                  KVContentWidget(
                                    title: "Note",
                                    content: Text(
                                      data.note ?? "No note provided",
                                    ),
                                  ),
                                  KVContentWidget(
                                    title: "AddOn",
                                    content: AddOnWidgetWrapper(
                                      addOns: data.addOns ?? [],
                                      selectedAddOns: bookingState.addOns,
                                      onSelected: (value) {
                                        setState(() {
                                          bookingNotifier.toggleAddon(value);
                                        });
                                      },
                                    ),
                                  ),
                                  KVContentWidget(
                                    title: "Date and Time",
                                    content: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          behavior: HitTestBehavior.translucent,
                                          onTap: () => _showDatePicker(
                                              data.includeEndDate ?? false),
                                          child: InputField(
                                            controller: _startDateController,
                                            enabled: false,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        TimeList(
                                            selectedTimeListData:
                                                bookingState.time.toList(),
                                            timeListData:
                                                data.timeList24H ?? [],
                                            onTimeListTap: (value, isSelected) {
                                              if (isSelected) {
                                                bookingState.time.add(value);
                                              } else {
                                                bookingState.time.remove(value);
                                              }
                                            }),
                                      ],
                                    ),
                                  ),
                                  KVContentWidget(
                                      title: "Accomodation",
                                      content: Text(
                                        data.accomodation ??
                                            "No accomodation provided",
                                        style: const TextStyle(fontSize: 16),
                                      )),
                                  const KVContentWidget(
                                      title: "Reviews",
                                      content: ReviewWidgetMock()),
                                  KVContentWidget(
                                    title: "Buy Product",
                                    content: PrimaryButton(
                                        // isDisabled: true,
                                        isDisabled: (data.status == false),
                                        onPressed: () =>
                                            _showPersonSelector(data),
                                        child: Text(
                                          'Buy Product',
                                          style: whiteTextStyle.copyWith(
                                              fontSize: 16),
                                        )),
                                  )
                                ],
                              ),
                              initenary: DetailIniteraryWidget(
                                  initenaryList: data.facilities ?? []),
                            ),
                          ),
                        ],
                      ),
                    ),
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
  final bool avaiable;
  const _Header(
      {super.key,
      this.avaiable = false,
      this.title = "Title not found",
      this.imgUrl = "",
      this.location = "",
      this.rating = "-.-",
      this.rangePricing = "--\$",
      this.tripDuration = "N/a"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: imgUrl,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageBuilder: (context, imageProvider) => Container(
              width: double.infinity,
              height: 241,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
                    Status(
                      status:
                          avaiable ? StatusColor.available : StatusColor.error,
                      text: avaiable ? "Avaiable" : "Not Avaiable",
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
                    LikeButton(
                      onTap: (status) {
                        debugPrint("Like button tapped");
                        return Future(() => false);
                      },
                    )
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
