import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/order/domain/order_model.dart';
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

  Widget imageTitle() {
    return Container(
      width: double.infinity,
      height: 157,
      padding: EdgeInsets.all(16),
      color: whiteColor,
      child: Row(
        children: [
          Container(
            width: 181,
            height: 125,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(smallRadius),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/rinjani.jpeg'))),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Rinjani Trip',
                style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
              ),
              Text(
                'Lombok, Indonesia',
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              ),
              Text(
                'Duration: 2 Days 1 night',
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget tripDetail() {
    OrderModel state = ref.watch(orderRiverpodProvider);
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
                  title: Text(state.date)),
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
                  title: Text(ref
                      .read(orderRiverpodProvider.notifier)
                      .getTimeInStringFormat())),
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
                  title: Text("${state.person ?? 0} Person")),
            ],
          )
        ],
      ),
    );
  }

  Widget addOn() {
    return Container(
      padding: EdgeInsets.all(16),
      color: whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your add on',
            style: blackTextStyle.copyWith(fontSize: 20),
          ),
          CupertinoListTile(
              padding: EdgeInsets.all(0),
              leading: Icon(
                Icons.time_to_leave,
                color: blackColor,
              ),
              title: Text(
                'Rp.200.000',
                style: greenTextStyle,
              ))
        ],
      ),
    );
  }

  Widget payment(BuildContext context) {
    return Container(
      color: whiteColor,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          InputFormField(
            controller: _priceRangeController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "required";
              }
              //TODO: tembahkan validasi berdasarkan harga terendah dan harga tertinggi
              return null;
            },
            label: 'Enter your price offer',
            secureText: false,
            placeholder: 'Price should be in range',
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
                Navigator.popAndPushNamed(context, '/success-booking-page');
              })
        ],
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
