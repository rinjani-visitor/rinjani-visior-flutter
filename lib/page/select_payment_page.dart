import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

final paymentMethod = [
  {"name": "Pay with Wise (USD)", "imgSrc": "assets/wise-logo.png"},
  {"name": "Pay with Bank NTB (IDR)", "imgSrc": "assets/wise-logo.png"},
];

class SelectPaymentPage extends StatefulWidget {
  const SelectPaymentPage({super.key});

  @override
  State<SelectPaymentPage> createState() => _SelectPaymentPageState();
}

class _SelectPaymentPageState extends State<SelectPaymentPage> {
  @override
  Widget build(BuildContext context) {
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
                const Text("TAX: 5%"),
                const Text("Subtotal: \$60"),
                Text(
                  "Total: \$63",
                  style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
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
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: GestureDetector(
                        onTap: () {
                          debugPrint("tapped");
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
