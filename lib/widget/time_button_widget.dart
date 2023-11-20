import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

class TimeButtonWidget extends StatefulWidget {
  final bool selected;
  final String time;
  final void Function(String value, bool isSelected) onToggle;
  const TimeButtonWidget(
      {super.key,
      required this.time,
      required this.onToggle,
      this.selected = false});

  @override
  State<TimeButtonWidget> createState() => _TimeButtonWidgetState();
}

class _TimeButtonWidgetState extends State<TimeButtonWidget> {
  late bool isSelected = widget.selected;
  void _handleButtonTap() {
    setState(() {
      isSelected = !isSelected;
    });
    widget.onToggle(widget.time, isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
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
            widget.time,
            style: isSelected
                ? whiteTextStyle.copyWith(fontWeight: medium, fontSize: 16)
                : blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
          )),
        ));
  }
}
