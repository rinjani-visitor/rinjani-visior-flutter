import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/utils/internationalization.dart';
import 'package:rinjani_visitor/features/order/presentation/order_riverpod.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/button/primary_button.dart';
import 'package:rinjani_visitor/widget/input_field.dart';

class BookingDetailPage extends ConsumerStatefulWidget {
  const BookingDetailPage({Key? key}) : super(key: key);

  @override
  ConsumerState<BookingDetailPage> createState() => _BookingDetailPageState();
}

class _BookingDetailPageState extends ConsumerState<BookingDetailPage> {
  final _priceRangeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late final _viewModel = ref.read(orderRiverpodProvider.notifier);
  late final _state = ref.read(orderRiverpodProvider);

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
                    image: AssetImage('assets/rinjani.jpeg'))),
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
      padding: EdgeInsets.all(16),
      color: whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trip detail',
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
          ),
          SizedBox(
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
              SizedBox(
                height: 4,
              ),
              CupertinoListTile(
                  leadingToTitle: 4,
                  padding: EdgeInsets.all(0),
                  leading: Icon(
                    Icons.calendar_month,
                    color: blackColor,
                  ),
                  title: Text(dateFormat.format(_viewModel.getDate()))),
              Text(
                'Arrival',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              SizedBox(
                height: 4,
              ),
              CupertinoListTile(
                  leadingToTitle: 4,
                  padding: EdgeInsets.all(0),
                  leading: Icon(
                    Icons.access_time,
                    color: blackColor,
                  ),
                  title: Text(_viewModel.getTimeInStringFormat())),
              Text(
                'Person',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              SizedBox(
                height: 4,
              ),
              CupertinoListTile(
                  leadingToTitle: 4,
                  padding: EdgeInsets.all(0),
                  leading: Icon(
                    Icons.person,
                    color: blackColor,
                  ),
                  title: Text("${_state.person ?? 0} Person")),
              Text(
                'Add On(s)',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    _state.addOn.length,
                    (index) => Text(
                          "- ${_state.addOn.elementAt(index).name} - ${_state.addOn.elementAt(index).price}\$",
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
            'Estimated Price we can offer',
            style: blackTextStyle.copyWith(fontSize: body1),
          ),
          Text(
            '${_state.totalPrice}\$',
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
                if (int.parse(value) < _state.totalPrice - 20) {
                  return "Price you offered is too low";
                }
                //TODO: tembahkan validasi berdasarkan harga terendah dan harga tertinggi
                return null;
              },
              label: 'Enter your price offer',
              secureText: false,
              placeholder: 'should not be too lower than estimated',
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
            ),
            PrimaryButton(
                child: Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(smallRadius)),
                    child: Text(
                      'Make an offer',
                      style: whiteTextStyle.copyWith(fontWeight: medium),
                    )),
                onPressed: () {
                  if (_formKey.currentState?.validate() == false) {
                    return;
                  }
                  Navigator.popAndPushNamed(context, '/success-booking');
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
                    SizedBox(
                      height: 8,
                    ),
                    addOn(),
                    SizedBox(
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
