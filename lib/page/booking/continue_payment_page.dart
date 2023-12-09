import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/presentation/services/camera_service.dart';
import 'package:rinjani_visitor/core/presentation/widget/button/primary_button.dart';
import 'package:rinjani_visitor/core/presentation/widget/form/upload_button.dart';
import 'package:rinjani_visitor/core/presentation/widget/form/input_field.dart';
import 'package:rinjani_visitor/features/order/data/adapter/payment.dart';
import 'package:rinjani_visitor/features/order/domain/entity/payment_method.dart';
import 'package:rinjani_visitor/features/order/presentation/view_model/payment.dart';

const label = [
  {"field1": "email", "field2": "account name"},
  {"field1": "bank name", "field2": "account name"}
];

class ContinuePaymentPage extends ConsumerStatefulWidget {
  const ContinuePaymentPage({super.key});

  @override
  ConsumerState<ContinuePaymentPage> createState() =>
      _ContinuePaymentPageState();
}

class _ContinuePaymentPageState extends ConsumerState<ContinuePaymentPage> {
  File? selectedImage;
  final TextEditingController _field1Controller = TextEditingController();
  final TextEditingController _field2Controller = TextEditingController();

  // === functions === //

  void _showFileSelection() async {
    final camNotifier = ref.read(cameraServiceProvider.notifier);
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel")),
        actions: [
          CupertinoActionSheetAction(
              onPressed: () async {
                Navigator.pop(context);
                selectedImage = await camNotifier.openCamera();
              },
              child: const Text("Open Camera")),
          CupertinoActionSheetAction(
              onPressed: () async {
                Navigator.pop(context);
                selectedImage = await camNotifier.openImagePicker();
              },
              child: const Text("Open Gallery")),
          ref.watch(cameraServiceProvider) != null
              ? CupertinoActionSheetAction(
                  isDestructiveAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                    camNotifier.discardCurrentFile();
                    selectedImage = null;
                  },
                  child: const Text("Delete"))
              : Container()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fileImage = ref.watch(cameraServiceProvider);
    final payment = ref.watch(orderPaymentViewModelProvider);
    final isWise = payment.paymentMethod is WisePaymentMethod;
    final texts = isWise ? label[0] : label[1];
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Payment'),
          automaticallyImplyLeading: false,
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
                  Row(
                    children: [
                      Container(
                          constraints: const BoxConstraints.expand(
                            height: 96,
                            width: 96,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: lightGray)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                                image: AssetImage(isWise
                                    ? 'assets/wise-logo.png'
                                    : 'assets/bank-ntb-syariah.png')),
                          )),
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
                            isWise ? "Wise Provider" : "Bank NTB Syariah",
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
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
                        texts["field1"]!,
                        style: blackTextStyle.copyWith(fontSize: subtitle1),
                      ),
                      InputFormField(
                        controller: _field1Controller,
                      ),
                      Text(
                        texts["field2"]!,
                        style: blackTextStyle.copyWith(fontSize: subtitle1),
                      ),
                      InputFormField(
                        controller: _field2Controller,
                      ),
                      Text(
                        "Upload your payment proof",
                        style: blackTextStyle.copyWith(fontSize: subtitle1),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      UploadButton(
                        onPressed: () {
                          _showFileSelection();
                        },
                        file: fileImage,
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
                            .finalizePaymentMethod(_field1Controller.text,
                                _field2Controller.text, selectedImage);
                        ref
                            .read(orderPaymentViewModelProvider.notifier)
                            .sendPayment(() {
                          Navigator.popUntil(
                              context, ModalRoute.withName('/home'));
                        }, (message) {
                          Fluttertoast.showToast(msg: message);
                        });
                      })
                ],
              ),
            ),
          ),
        ));
  }
}
