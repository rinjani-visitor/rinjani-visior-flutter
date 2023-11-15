import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/features/camera/presentation/provider/camera_provider.dart';
import 'package:rinjani_visitor/widget/button/primary_button.dart';
import 'package:rinjani_visitor/widget/form/upload_button.dart';
import 'package:rinjani_visitor/widget/input_field.dart';

class ContinuePaymentPage extends ConsumerStatefulWidget {
  const ContinuePaymentPage({super.key});

  @override
  ConsumerState<ContinuePaymentPage> createState() =>
      _ContinuePaymentPageState();
}

class _ContinuePaymentPageState extends ConsumerState<ContinuePaymentPage> {
  // File? selectedImage;

  // === functions === //

  void _showFileSelection() async {
    final camNotifier = ref.read(cameraProvider.notifier);
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel")),
        actions: [
          CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                camNotifier.openCamera();
              }, child: const Text("Open Camera")),
          CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                camNotifier.openImagePicker();
              },
              child: const Text("Open Gallery")),
          ref.watch(cameraProvider) != null
              ? CupertinoActionSheetAction(
                  isDestructiveAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                    camNotifier.discardCurrentFile();
                  },
                  child: const Text("Delete"))
              : Container()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fileImage = ref.watch(cameraProvider);
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
                        file: fileImage,
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
