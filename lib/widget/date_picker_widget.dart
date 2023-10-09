import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({Key? key}) : super(key: key);

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime selectedDate = DateTime.now();
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
                    'Date: ${selectedDate.day} - ${selectedDate.month} - ${selectedDate.year}',
                    style: blackTextStyle,
                  )
                ],
              ),
            ),
            onPressed: () {
              showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) => ConstrainedBox(
                        constraints: const BoxConstraints.expand(height: 250),
                        child: CupertinoDatePicker(
                            backgroundColor: whiteColor,
                            use24hFormat: true,
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (DateTime newTime) {
                              setState(() => selectedDate = newTime);
                            }),
                      ));
            })
      ],
    );
  }
}
