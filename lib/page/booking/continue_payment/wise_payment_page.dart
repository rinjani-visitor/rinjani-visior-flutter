import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/core/constant/constant.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/presentation/services/camera_service.dart';
import 'package:rinjani_visitor/core/presentation/widget/button/primary_button.dart';
import 'package:rinjani_visitor/core/presentation/widget/form/upload_button.dart';
import 'package:rinjani_visitor/core/presentation/widget/form/input_field.dart';
import 'package:rinjani_visitor/features/order/presentation/view_model/payment.dart';

//TODO: this code section need huge refactor

class WisePaymentPage extends ConsumerStatefulWidget {
  const WisePaymentPage({super.key});

  @override
  ConsumerState<WisePaymentPage> createState() => _WisePaymentPageState();
}

class _WisePaymentPageState extends ConsumerState<WisePaymentPage> {
  File? selectedImage;
  bool isLoading = false;
  final TextEditingController _field1Controller = TextEditingController();
  final TextEditingController _field2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedImage = null;
  }

  void clear() {
    final camNotifier = ref.read(cameraServiceProvider.notifier);
    camNotifier.discardCurrentFile();
    selectedImage = null;
  }

  void submit() {
    setState(() {
      isLoading = true;
    });
    ref.read(orderPaymentViewModelProvider.notifier).finalizePaymentMethod(
        _field1Controller.text, _field2Controller.text, selectedImage);
    ref.read(orderPaymentViewModelProvider.notifier).sendPayment(() {
      setState(() {
        isLoading = false;
      });
      Navigator.popUntil(context, ModalRoute.withName('/home'));
    }, (message) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: message);
    });
  }

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
          selectedImage != null
              ? CupertinoActionSheetAction(
                  isDestructiveAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                    clear();
                  },
                  child: const Text("Delete"))
              : Container()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final isWise = payment.paymentMethod is WisePaymentMethod;
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
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(image: AssetImage(IMG_WISE)),
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
                            "Wise Provider",
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
                        "Wise Email",
                        style: blackTextStyle.copyWith(fontSize: subtitle1),
                      ),
                      InputFormField(
                        controller: _field1Controller,
                      ),
                      Text(
                        "Wise Account Name",
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
                        file: selectedImage,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  PrimaryButton(
                      isLoading: isLoading,
                      child: const Text("Send Payments"),
                      onPressed: () {
                        submit();
                      })
                ],
              ),
            ),
          ),
        ));
  }
}
