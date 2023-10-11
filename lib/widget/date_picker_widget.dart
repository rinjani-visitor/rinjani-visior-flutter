import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({Key? key}) : super(key: key);

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime _selectedDate = DateTime.now();

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
        Text(
          'Select time and Date',
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
        ),
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
                    'Date: ${_selectedDate.day} - ${_selectedDate.month} - ${_selectedDate.year}',
                    style: blackTextStyle,
                  )
                ],
              ),
            ),
            onPressed: () {
              _showDialog(CupertinoDatePicker(
                  initialDateTime: _selectedDate,
                  mode: CupertinoDatePickerMode.date,
                  use24hFormat: true,
                  // This shows day of week alongside day of month
                  showDayOfWeek: true,
                  onDateTimeChanged: (DateTime newTime) {
                    setState(() {
                      _selectedDate = newTime;
                    });
                  }));
            })
      ],
    );
  }
}
