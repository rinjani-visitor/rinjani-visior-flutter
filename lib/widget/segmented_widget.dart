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

final _mockInitenary = [
  '09:00 - 09:30 Go to sembalun',
  '09:30 - 10:00 Go to Rinjani',
  '10:00 - 11:00 Lunch'
];

final _mockDescription = [];

class DetailIniteraryWidget extends StatelessWidget {
  final List<String> initenaryList;
  const DetailIniteraryWidget({super.key, required this.initenaryList});

  String initenaryDatas() {
    var string = "";
    for (final item in initenaryList) {
      string = string += "$item\n";
    }
    return string;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Initenary',
              style:
                  blackTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              initenaryDatas(),
              style: TextStyle(fontSize: 16),
            ),
          ],
        ));
  }
}

class DetailDescriptionWidget extends StatefulWidget {
  final DatePickerWidget datePickerWidget;
  final ReviewWidget reviewWidget;
  final Widget addOnWidget;
  final String accomodation;
  final String description;
  final List<String> timeListFormat24H;
  const DetailDescriptionWidget({
    super.key,
    required this.datePickerWidget,
    required this.addOnWidget,
    required this.reviewWidget,
    required this.description,
    required this.accomodation,
    required this.timeListFormat24H,
  });

  @override
  State<DetailDescriptionWidget> createState() =>
      _DetailDescriptionWidgetState();
}

class _DetailDescriptionWidgetState extends State<DetailDescriptionWidget> {
  int personCount = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        //header here
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.description,
            style: blackTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Add On',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
          ),
          widget.addOnWidget,

          const SizedBox(
            height: 16,
          ),
          widget.datePickerWidget,

          const SizedBox(
            height: 8,
          ),
          // Flexible(
          //   fit: FlexFit.tight,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     padding: EdgeInsets.zero,
          //     itemBuilder: (context, index) =>
          //         TimeButtonWidget(time: widget.timeListFormat24H[index]),
          //   ),
          // ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Accomodation',
            style: blackTextStyle.copyWith(
                fontSize: heading5, fontWeight: semibold),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            widget.accomodation,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          widget.reviewWidget,
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
                        child: PersonCounterWidget(
                          onSubmit: (value) => personCount = value,
                        ),
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
    );
  }
}

class DetailSegmentedWidget extends StatefulWidget {
  final Widget descriptionWidget;
  final Widget initenaryWidget;
  const DetailSegmentedWidget(
      {Key? key,
      required this.descriptionWidget,
      required this.initenaryWidget})
      : super(key: key);

  @override
  _DetailSegmentedWidgetState createState() => _DetailSegmentedWidgetState();
}

class _DetailSegmentedWidgetState extends State<DetailSegmentedWidget> {
  Map<dynamic, Widget> children = <dynamic, Widget>{
    0: const Text('Description'),
    1: const Text('Initenary')
  };
  int _sliding = 0;

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
        _sliding == 0 ? widget.descriptionWidget : widget.initenaryWidget
      ],
    ));
  }
}
