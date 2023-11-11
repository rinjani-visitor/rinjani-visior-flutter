import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

class AddOnWidget extends StatefulWidget {
  /// Add on name.
  final String name;

  /// shows the price of addon. not include price unit formatting
  final String price;

  /// initial value.
  final bool selected;
  final void Function(bool? value)? onChanged;
  const AddOnWidget(
      {super.key,
      required this.name,
      required this.price,
      required this.selected,
      required this.onChanged});

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
              Text('${widget.name} - ${widget.price}')
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
              value: widget.selected,
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
        debugPrint("State: $p0");
      },
      name: "Driver",
      price: "Rp.200.000",
      selected: val,
    );
  }
}
