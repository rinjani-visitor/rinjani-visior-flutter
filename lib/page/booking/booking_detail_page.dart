import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/constant/constant.dart';
import 'package:rinjani_visitor/features/booking/presentation/view_model/booking_form.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/presentation/widget/button/primary_button.dart';
import 'package:rinjani_visitor/core/presentation/widget/form/input_field.dart';

class BookingDetailPage extends ConsumerStatefulWidget {
  const BookingDetailPage({super.key});

  @override
  ConsumerState<BookingDetailPage> createState() => _BookingDetailPageState();
}

class _BookingDetailPageState extends ConsumerState<BookingDetailPage> {
  final _priceRangeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late final _viewModel = ref.read(bookingFormViewModelProvider.notifier);
  late final _state = ref.read(bookingFormViewModelProvider);

  Widget imageTitle() {
    return Container(
      width: double.infinity,
      height: 157,
      padding: const EdgeInsets.all(16),
      color: whiteColor,
      child: Row(
        children: [
          Container(
            width: 181,
            height: 125,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(smallRadius),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        _state.product?.thumbnail ?? IMG_PLACEHOLDER))),
          ),
          const SizedBox(
            width: 16,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _state.product?.title ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: blackTextStyle.copyWith(
                      fontSize: heading5, fontWeight: bold),
                ),
                Text(
                  _state.product?.location ?? "",
                  overflow: TextOverflow.ellipsis,
                  style:
                      blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                ),
                Text(
                  'Duration: ${_state.product?.tripDuration}',
                  overflow: TextOverflow.ellipsis,
                  style:
                      blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget tripDetail() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trip detail',
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(
                height: 4,
              ),
              CupertinoListTile(
                  leadingToTitle: 4,
                  padding: const EdgeInsets.all(0),
                  leading: const Icon(
                    Icons.calendar_month,
                    color: blackColor,
                  ),
                  title: Text(_viewModel.getLocalizedDate())),
              Text(
                'Arrival',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(
                height: 4,
              ),
              CupertinoListTile(
                  leadingToTitle: 4,
                  padding: const EdgeInsets.all(0),
                  leading: const Icon(
                    Icons.access_time,
                    color: blackColor,
                  ),
                  title: Text(_viewModel.getTimeInStringFormat())),
              Text(
                'Person',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(
                height: 4,
              ),
              CupertinoListTile(
                  leadingToTitle: 4,
                  padding: const EdgeInsets.all(0),
                  leading: const Icon(
                    Icons.person,
                    color: blackColor,
                  ),
                  title: Text("${_state.totalPersons} Person")),
              Text(
                'Add On(s)',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    _state.addOns.length,
                    (index) => Text(
                          "- ${_state.addOns.elementAt(index)}",
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: medium),
                        )),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget addOn() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lowest Price we can offer',
            style: blackTextStyle.copyWith(fontSize: body1),
          ),
          Text(
            '${_state.offeringPrice}\$',
            style: greenTextStyle.copyWith(fontSize: heading5),
          )
        ],
      ),
    );
  }

  Widget payment(BuildContext context) {
    return Container(
      color: whiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            InputFormField(
              controller: _priceRangeController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "This field should not be empty";
                }
                if (int.parse(value) < _state.offeringPrice) {
                  return "Price you offered is lower dan the lowest price we can offer";
                }
                return null;
              },
              label: 'Enter your price offer',
              secureText: false,
              placeholder: 'put your price offer here',
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
            ),
            PrimaryButton(
                child: Text(
                  'Make an offer',
                  style: whiteTextStyle.copyWith(fontWeight: medium),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() == false) {
                    return;
                  }
                  // _viewModel.submitBooking(context);
                  Navigator.pushNamed(context, "/booking/submit");
                })
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Booking details'),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    imageTitle(),
                    const SizedBox(
                      height: 8,
                    ),
                    tripDetail(),
                    const SizedBox(
                      height: 8,
                    ),
                    addOn(),
                    const SizedBox(
                      height: 8,
                    ),
                    payment(context)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
