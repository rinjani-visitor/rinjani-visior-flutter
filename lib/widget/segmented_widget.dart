import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/date_picker_widget.dart';
import 'package:rinjani_visitor/widget/review_widget.dart';
import 'package:rinjani_visitor/widget/time_button_widget.dart';

class DetailDescriptionWidget extends StatefulWidget {
  final String description;
  final String accomodation;
  final Widget addOn;
  final DatePickerWidget datePicker;

  /// receive [TimeList] widget
  final TimeList timeList;
  final ReviewWidget review;
  final Widget buyProduct;

  const DetailDescriptionWidget({
    super.key,
    required this.description,
    required this.accomodation,
    required this.addOn,
    required this.datePicker,
    required this.timeList,
    required this.review,
    required this.buyProduct,
  });

  @override
  State<DetailDescriptionWidget> createState() =>
      _DetailDescriptionWidgetState();
}

class _DetailDescriptionWidgetState extends State<DetailDescriptionWidget> {
  int personCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      //header here
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: blackTextStyle.copyWith(
            fontSize: body2,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Add On',
          style: blackTextStyle.copyWith(fontSize: body1, fontWeight: semibold),
        ),
        widget.addOn,
        const SizedBox(
          height: 16,
        ),
        widget.datePicker,
        const SizedBox(
          height: 8,
        ),
        widget.timeList,
        const SizedBox(
          height: 16,
        ),
        Text(
          'Accomodation',
          style:
              blackTextStyle.copyWith(fontSize: heading5, fontWeight: semibold),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          widget.accomodation,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 8,
        ),
        widget.review,
        widget.buyProduct,
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

class TimeList extends StatelessWidget {
  const TimeList({
    super.key,
    required this.timeListData,
    required this.initialSelectedTimeListData,
    required this.onTimeListTap,
  });

  final List<String> timeListData;
  final List<String> initialSelectedTimeListData;
  final void Function(String value, bool isSelected) onTimeListTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(timeListData.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: TimeButtonWidget(
              time: timeListData[index],
              selected:
                  initialSelectedTimeListData.contains(timeListData[index]),
              onToggle: (value, isSelected) {
                onTimeListTap(value, isSelected);
              },
            ),
          );
        }),
      ),
    );
  }
}

// ===== // parent // ===== //

class DetailSegmentedWidget extends StatefulWidget {
  final Widget description;
  final Widget initenary;

  const DetailSegmentedWidget(
      {Key? key, required this.description, required this.initenary})
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
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
        Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: _sliding == 0 ? widget.description : widget.initenary,
        )
      ],
    );
  }
}

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Initenary',
          style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          initenaryDatas(),
          style: TextStyle(fontSize: body1),
        ),
      ],
    );
  }
}
