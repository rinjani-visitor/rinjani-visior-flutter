import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class FilePickerWidget extends StatefulWidget {
  const FilePickerWidget({Key? key}) : super(key: key);

  @override
  _FilePickerWidgetState createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  FilePickerResult? result;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('file name here'),
        Container(
          width: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
              onPressed: () async {
                result = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: ['jpg', 'png', 'pdf']);
                if (result == null) {
                  print("No file selected");
                } else {
                  setState(() {});
                  for (var element in result!.files) {
                    print(element.name);
                  }
                }
              },
              child: Text('Upload your payment')),
        ),
      ],
    );
  }
}
