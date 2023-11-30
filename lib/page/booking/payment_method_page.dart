import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/features/booking/presentation/view_model/booking_detail.dart';
import 'package:rinjani_visitor/features/order/domain/entity/payment_method.dart';
import 'package:rinjani_visitor/features/order/presentation/view_model/payment.dart';

final paymentMethod = [
  {
    "name": "Pay with Wise (USD)",
    "imgSrc": "assets/wise-logo.png",
  },
  {"name": "Pay with Bank NTB (IDR)", "imgSrc": "assets/bank-ntb-syariah.png"},
];

class PaymentMethodPage extends ConsumerStatefulWidget {
  final String bookingId;
  const PaymentMethodPage({super.key, required this.bookingId});

  @override
  ConsumerState<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends ConsumerState<PaymentMethodPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(bookingDetailViewModelProvider.notifier).get(widget.bookingId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final paymentWatch = ref.watch(orderPaymentViewModelProvider);
    final bookingDetail = ref.watch(bookingDetailViewModelProvider);
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Select Payment"),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Payment Transfer",
                  style: blackTextStyle.copyWith(
                      fontSize: heading4, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                bookingDetail.maybeWhen(
                    orElse: () => Text(""),
                    data: (data) {
                      return Text(
                        "Total: ${data?.offeringPrice}\$",
                        style: blackTextStyle.copyWith(
                            fontSize: subtitle1, fontWeight: FontWeight.bold),
                      );
                    }),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  "Select Payment Method",
                  style: blackTextStyle.copyWith(
                      fontSize: subtitle1, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: paymentMethod.length,
                  itemBuilder: (context, index) {
                    final currentData = paymentMethod[index];
                    final isWise = index == 0;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          final bookingId = bookingDetail.value?.bookingId;
                          isWise
                              ? ref
                                  .read(orderPaymentViewModelProvider.notifier)
                                  .addWisePaymentMethod(
                                      WisePaymentMethod(bookingId!))
                              : ref
                                  .read(orderPaymentViewModelProvider.notifier)
                                  .addBankPaymentMethod(
                                      BankPaymentMethod(bookingId!));
                          ref
                              .read(orderPaymentViewModelProvider.notifier)
                              .setBookingId(bookingDetail.value!);
                          Navigator.pushNamed(context, "/booking/payment");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: gray,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      border: Border.all(
                                          color: lightGray, width: 2.0),
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "${currentData["imgSrc"]}"),
                                          fit: BoxFit.contain)),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(child: Text("${currentData["name"]}")),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
