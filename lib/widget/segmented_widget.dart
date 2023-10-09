import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/accomodation_widget.dart';
import 'package:rinjani_visitor/widget/add_on_widget.dart';
import 'package:rinjani_visitor/widget/button/primary_button.dart';
import 'package:rinjani_visitor/widget/date_picker_widget.dart';
import 'package:rinjani_visitor/widget/person_counter_widget.dart';
import 'package:rinjani_visitor/widget/review_widget.dart';
// import 'package:rinjani_visitor/widget/date_picker_widget.dart';
import 'package:rinjani_visitor/widget/time_button_widget.dart';

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

  Widget initenary() {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Initenary',
              style:
                  blackTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '09:00 - 09:30 Go to sembalun\n'
              '09:30 - 10:00 Go to Rinjani\n'
              '10:00 - 11:00 Lunch\n',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ));
  }

  Widget description() {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          //header here
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Indah Pemandangan Air Terjun Sindang Gila yang memiliki 2 terjunan, satu-satunya yang ada di Pulau Lombok.",
              style: blackTextStyle.copyWith(
                fontSize: 14,
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
                AddOnWidgetMock(),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              children: [
                DatePickerWidget(),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TimeButtonWidget(
                      time: '09:00 AM',
                    ),
                    TimeButtonWidget(
                      time: '10:00 AM',
                    ),
                    TimeButtonWidget(
                      time: '11:00 AM',
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            AccomodationWidget(),
            SizedBox(
              height: 8,
            ),
            ReviewWidget(),
            LoginButton(
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(bigRadius)),
                          child: PersonCounterWidget(),
                        );
                      });
                },
                child: Text(
                  'Buy Product',
                  style: whiteTextStyle.copyWith(fontSize: 16),
                )),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          child: CupertinoSlidingSegmentedControl(
              groupValue: _sliding,
              children: children,
              onValueChanged: (value) {
                setState(() {
                  _sliding = value;
                });
              }),
        ),
        _sliding == 0 ? description() : initenary()
      ],
    ));
  }
}
