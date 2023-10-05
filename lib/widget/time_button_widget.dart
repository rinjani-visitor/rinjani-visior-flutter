import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class TimeButtonWidget extends StatefulWidget {
  final String time;
  const TimeButtonWidget({Key? key, required this.time}) : super(key: key);

  @override
  State<TimeButtonWidget> createState() => _TimeButtonWidgetState();
}

class _TimeButtonWidgetState extends State<TimeButtonWidget> {
  bool isSelected = false;
  void _handleButtonTap() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _handleButtonTap,
        child: Container(
          width: 100,
          height: 36,
          decoration: BoxDecoration(
              color: isSelected ? primaryColor : Colors.transparent,
              border: isSelected
                  ? Border.all(color: Colors.transparent)
                  : Border.all(color: lightGray),
              borderRadius: BorderRadius.circular(smallRadius)),
          child: Center(
              child: Text(
            '${widget.time}',
            style: isSelected
                ? whiteTextStyle.copyWith(fontWeight: medium, fontSize: 16)
                : blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
          )),
        ));
  }
}
