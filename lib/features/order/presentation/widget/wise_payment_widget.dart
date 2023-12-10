import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/presentation/widget/button/primary_button.dart';
import 'package:rinjani_visitor/core/presentation/widget/form/input_field.dart';
import 'package:rinjani_visitor/core/presentation/widget/form/upload_button.dart';
import 'package:rinjani_visitor/features/order/presentation/view_model/payment.dart';


class WisePaymentWidget extends ConsumerStatefulWidget {
  final TextEditingController field1Controller;
  final TextEditingController field2Controller;
  final File? file;
  final Function() onUploadPressed;

  const WisePaymentWidget(this.field1Controller, this.field2Controller, this.file, this.onUploadPressed, {super.key});

  @override
  ConsumerState<WisePaymentWidget> createState() => _WisePaymentWidgetState();
}

class _WisePaymentWidgetState extends ConsumerState<WisePaymentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Container(
              constraints: BoxConstraints.expand(
                height: 96,
                width: 96,
              ),
              decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: lightGray)),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(image: AssetImage('assets/wise-logo.png')),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You choose",
                  style: blackTextStyle,
                ),
                Text(
                  "Wise Provider",
                  style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ))
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: blackTextStyle.copyWith(fontSize: subtitle1),
            ),
            InputFormField(
              controller: widget.field1Controller,
            ),
            Text(
              "account name",
              style: blackTextStyle.copyWith(fontSize: subtitle1),
            ),
            InputFormField(
              controller: widget.field2Controller,
            ),
            Text(
              "Upload your payment proof",
              style: blackTextStyle.copyWith(fontSize: subtitle1),
            ),
            const SizedBox(
              height: 8,
            ),
            UploadButton(
              onPressed: () => widget.onUploadPressed(),
              file: widget.file,
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        PrimaryButton(
            child: const Text("Send Payments"),
            onPressed: () {
              ref
                  .read(orderPaymentViewModelProvider.notifier)
                  .finalizePaymentMethod(widget.field1Controller.text,
                      widget.field2Controller.text, widget.file);
              ref.read(orderPaymentViewModelProvider.notifier).sendPayment(() {
                Navigator.popUntil(context, ModalRoute.withName('/home'));
              }, (message) {
                Fluttertoast.showToast(msg: message);
              });
            })
      ],
    );
  }
}
