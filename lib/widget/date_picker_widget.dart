import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/utils/internationalization.dart';
import 'package:rinjani_visitor/theme/theme.dart';

/// Date Picker widget with ISO8601 date format.
///
/// [onChange] - `dateVal` parameter will provide string date with ISO 8601 format
class DatePickerWidget extends StatefulWidget {
  final DateTime? initialDate;
  final void Function(String? dateVal) onChange;
  const DatePickerWidget({
    Key? key,
    this.initialDate,
    required this.onChange,
  }) : super(key: key);

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  final DateTime _nowDate = DateTime.now();
  late final DateTime _minimumDate =
      DateTime(_nowDate.year, _nowDate.month, _nowDate.day);
  late DateTime _selectedDate = widget.initialDate ??
      DateTime(_nowDate.year, _nowDate.month, _nowDate.day + 1);

  @override
  void initState() {
    debugPrint("date: ${widget.initialDate}}");
    super.initState();
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(bigRadius), color: whiteColor),
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        // color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CupertinoButton(
            padding: EdgeInsets.all(0),
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(height: 32),
              child: Row(
                children: [
                  Container(
                    height: 48,
                    width: 32,
                    decoration: BoxDecoration(
                        border: Border.all(color: lightGray),
                        borderRadius: BorderRadius.circular(smallRadius)),
                    child: Icon(
                      Icons.calendar_month,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Date: ${dateFormat.format(_selectedDate)}',
                    style: blackTextStyle,
                  )
                ],
              ),
            ),
            onPressed: () {
              _showDialog(CupertinoDatePicker(
                  initialDateTime: _selectedDate,
                  mode: CupertinoDatePickerMode.date,
                  minimumDate: _minimumDate,
                  minimumYear: _minimumDate.year,
                  use24hFormat: true,
                  // This shows day of week alongside day of month
                  showDayOfWeek: true,
                  onDateTimeChanged: (DateTime newTime) {
                    setState(() {
                      _selectedDate = newTime;
                    });
                    debugPrint("date: ${widget.initialDate}");
                    widget.onChange(newTime.toIso8601String());
                  }));
            })
      ],
    );
  }
}
