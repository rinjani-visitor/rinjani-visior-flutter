import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rinjani_visitor/theme/theme.dart';
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

class _ContinuePaymentPageState extends ConsumerState<ContinuePaymentPage> {
  File? _imageFile;
  void _openFile() async {
    if (await Permission.photos.request().isGranted) {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      _imageFile = File(pickedImage.path);
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
                          _openFile();
                        },
                        file: _imageFile,
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
