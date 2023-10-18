import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class AddOnWidget extends StatefulWidget {
  final String name;
  final String price;
  final bool value;
  final void Function(bool? value)? onChanged;
  const AddOnWidget(
      {Key? key,
      required this.name,
      required this.price,
      required this.value,
      required this.onChanged})
      : super(key: key);

  @override
  State<AddOnWidget> createState() => _AddOnWidgetState();
}

class _AddOnWidgetState extends State<AddOnWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8.0),
      child: Row(
        children: [
          Row(
            children: [
              Icon(
                Icons.directions_car,
                color: blackColor,
              ),
              const SizedBox(
                width: 8,
              ),
              const Text('Driver - Rp.200.000')
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 24,
            height: 24,
            child: CupertinoCheckbox(
              onChanged: (value) {
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
              value: widget.value,
            ),
          )
        ],
      ),
    );
  }
}

class AddOnWidgetMock extends StatefulWidget {
  const AddOnWidgetMock({super.key});

  @override
  State<AddOnWidgetMock> createState() => _AddOnWidgetMockState();
}

class _AddOnWidgetMockState extends State<AddOnWidgetMock> {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return AddOnWidget(
      onChanged: (p0) {
        setState(() {
          val = !val;
        });
        debugPrint("State: ${p0}");
      },
      name: "Driver",
      price: "Rp.200.000",
      value: val,
    );
  }
}
