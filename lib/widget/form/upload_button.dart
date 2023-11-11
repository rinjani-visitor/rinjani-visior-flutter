import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:dotted_border/dotted_border.dart';

class UploadButton extends StatelessWidget {
  final void Function()? onPressed;
  final File? file;

  const UploadButton({super.key, required this.onPressed, this.file});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border.all(color: lightGray),
                borderRadius: BorderRadius.circular(8)),
            child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(4),
                color: lightGray,
                child: Center(
                    child: file != null
                        ? Text(
                            "File Selected : ${file!.path.split(Platform.pathSeparator).last} ")
                        : const Text(
                            'Click to Upload Payment (JPEG, JPG, PNG)')))),
      ),
    );
  }
}
