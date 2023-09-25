import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class AddOnWidget extends StatefulWidget {
  const AddOnWidget({Key? key}) : super(key: key);

  @override
  State<AddOnWidget> createState() => _AddOnWidgetState();
}

class _AddOnWidgetState extends State<AddOnWidget> {
  bool addOnCheck = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 357,
      height: 48,
      child: Row(
        children: [
          Row(
            children: [
              Icon(
                Icons.directions_car,
                color: blackColor,
              ),
              SizedBox(
                width: 8,
              ),
              Text('Driver - Rp.200.000')
            ],
          ),
          Spacer(),
          CupertinoCheckbox(
            value: addOnCheck,
            onChanged: (value) {
              //TODO: Put this at root page instead of child to avoid re-rendering

              setState(() {
                addOnCheck = !addOnCheck;
              });
            },
          )
        ],
      ),
    );
  }
}
