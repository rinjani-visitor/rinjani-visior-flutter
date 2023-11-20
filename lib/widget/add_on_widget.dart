import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

class AddOnWidget extends StatefulWidget {
  final String id;

  /// Add on name.
  final String name;

  /// shows the price of addon. not include price unit formatting
  final String price;

  /// initial value.
  final bool selected;
  final void Function(bool? value, bool isSelected)? onChanged;
  const AddOnWidget(
      {super.key,
      required this.name,
      required this.price,
      required this.selected,
      required this.onChanged,
      required this.id});

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
                  widget.onChanged!(value, widget.selected);
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
