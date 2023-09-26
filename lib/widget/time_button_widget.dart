import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class TimeButtonWidget extends StatefulWidget {
  const TimeButtonWidget({Key? key}) : super(key: key);

  @override
  State<TimeButtonWidget> createState() => _TimeButtonWidgetState();
}

class _TimeButtonWidgetState extends State<TimeButtonWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          (bool? value) {
            setState(() {
              isSelected = true;
            });
          };
        },
        child: Container(
          width: 93,
          height: 36,
          decoration: BoxDecoration(
              color: isSelected ? primaryColor : Colors.transparent,
              border: Border.all(color: lightGray),
              borderRadius: BorderRadius.circular(smallRadius)),
          child: Center(
            child: Text(
              '09:00 AM',
              style: isSelected ? whiteTextStyle : blackTextStyle,
            ),
          ),
        ));
  }
}
