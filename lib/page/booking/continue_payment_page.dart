import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/widget/button/primary_button.dart';
import 'package:rinjani_visitor/widget/form/upload_button.dart';
import 'package:rinjani_visitor/widget/input_field.dart';
import 'package:permission_handler/permission_handler.dart';

class ContinuePaymentPage extends ConsumerStatefulWidget {
  const ContinuePaymentPage({super.key});

  @override
  ConsumerState<ContinuePaymentPage> createState() =>
      _ContinuePaymentPageState();
}

class _ContinuePaymentPageState extends ConsumerState<ContinuePaymentPage>
    with WidgetsBindingObserver {
  File? selectedImage;

  // === functions === //

  void _showFileSelection() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel")),
        actions: [
          CupertinoActionSheetAction(
              onPressed: () {}, child: const Text("Open Camera")),
          CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                _openImagePicker();
              },
              child: const Text("Open Gallery")),
          selectedImage != null
              ? CupertinoActionSheetAction(
                  isDestructiveAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                    _removeFile();
                  },
                  child: const Text("Delete"))
              : Container()
        ],
      ),
    );
  }

  void _removeFile() async {
    // create fake await
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      selectedImage = null;
    });
  }

  void _openImagePicker() async {
    if (await Permission.photos.request().isGranted) {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      setState(() {
        selectedImage = File(pickedImage.path);
      });
      return;
    }
    Fluttertoast.showToast(
        msg: 'Photo permission denied, please accept my humbly request');
  }

  @override
  Widget build(BuildContext context) {
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
                            child: Image(
                                image: AssetImage('assets/wise-logo.png')),
                          )),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: blackTextStyle,
                          ),
                          Text(
                            "put name here",
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Account Number",
                            style: blackTextStyle,
                          ),
                          Text(
                            "123456789",
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          )
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
                        "Your full name",
                        style: blackTextStyle.copyWith(fontSize: subtitle1),
                      ),
                      InputFormField(),
                      Text(
                        "Your registration",
                        style: blackTextStyle.copyWith(fontSize: subtitle1),
                      ),
                      InputFormField(),
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
                      child: const Text("Send Payments"), onPressed: () {})
                ],
              ),
            ),
          ),
        ));
  }
}
