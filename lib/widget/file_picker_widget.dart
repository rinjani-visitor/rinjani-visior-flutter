import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/theme/theme.dart';

class FilePickerWidget extends StatefulWidget {
  const FilePickerWidget({super.key});

  @override
  State<FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  FilePickerResult? result;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('file name here'),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
              onPressed: () async {
                result = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: ['jpg', 'png', 'pdf']);
                if (result == null) {
                  debugPrint("No file selected");
                } else {
                  setState(() {});
                  for (var element in result!.files) {
                    debugPrint(element.name);
                  }
                }
              },
              child: const Text('Upload your payment')),
        ),
      ],
    );
  }
}
