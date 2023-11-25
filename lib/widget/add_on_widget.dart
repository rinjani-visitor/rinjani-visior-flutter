import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

class AddOnWidget extends StatefulWidget {
  /// Add on name.
  final String name;
  final String? description;

  /// initial value.
  final bool selected;
  final void Function(bool? value, bool isSelected)? onChanged;
  const AddOnWidget({
    super.key,
    required this.name,
    required this.selected,
    required this.onChanged,
    this.description,
  });

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
          Icon(
            Icons.add_outlined,
            color: blackColor,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name),
                widget.description != null
                    ? Text("${widget.description}",
                        style:
                            const TextStyle(color: CupertinoColors.systemGrey2))
                    : Container(),
              ],
            ),
          ),
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
