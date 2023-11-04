import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class UploadButton extends StatelessWidget {
  final void Function() onPressed;

  const UploadButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(border: Border.all(color: lightGray)),
          child: Container(
              decoration: BoxDecoration(border: Border.all(color: lightGray)),
              child: Center(child: Text('Upload')))),
    );
  }
}
