import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/add_on_widget.dart';
import 'package:rinjani_visitor/widget/date_picker_widget.dart';

class SegmentedWidget extends StatefulWidget {
  const SegmentedWidget({Key? key}) : super(key: key);

  @override
  _SegmentedWidgetState createState() => _SegmentedWidgetState();
}

class _SegmentedWidgetState extends State<SegmentedWidget> {
  Map<dynamic, Widget> children = <dynamic, Widget>{
    0: const Text('Description'),
    1: const Text('Initenary')
  };
  int _sliding = 0;
  @override
  Widget build(BuildContext context) {
    Widget description() {
      return Container(
        width: 357,
        margin: EdgeInsets.only(top: 16),
        child: Column(
          //header here
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Indah Pemandangan Air Terjun Sindang Gila yang memiliki 2 terjunan, satu-satunya yang ada di Pulau Lombok.",
              style: blackTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              // add on here
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trip add on',
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semibold),
                ),
                AddOnWidget(),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            DatePickerWidget(),
          ],
        ),
      );
    }

    return CupertinoPageScaffold(
        child: Column(
      children: [
        Container(
          width: 357,
          child: CupertinoSlidingSegmentedControl(
              groupValue: _sliding,
              children: children,
              onValueChanged: (value) {
                setState(() {
                  _sliding = value;
                });
              }),
        ),
        _sliding == 0 ? description() : Text('hii')
      ],
    ));
  }
}
