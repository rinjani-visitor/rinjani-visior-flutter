import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/features/product/domain/entity/addon.dart';

class AddOnWidgetWrapper extends StatelessWidget {
  final List<AddonEntity> addOns;
  final List<String> selectedAddOns;
  final void Function(String addonId)? onSelected;

  const AddOnWidgetWrapper({
    super.key,
    required this.addOns,
    required this.selectedAddOns,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return addOns.isNotEmpty
        ? Column(
            children: List.generate(addOns.length, (index) {
            final current = addOns[index];
            return _AddOnWidget(
              name: current.title,
              selected: selectedAddOns.contains(current.title),
              onChanged: (value, isSelected) {
                if (onSelected != null) {
                  onSelected!(current.title);
                }
              },
            );
          }))
        : const Text("Add On unavailable for this package");
  }
}

class _AddOnWidget extends StatefulWidget {
  /// Add on name.
  final String name;
  final String? description;

  /// initial value.
  final bool selected;
  final void Function(bool? value, bool isSelected)? onChanged;
  const _AddOnWidget({
    required this.name,
    required this.selected,
    required this.onChanged,
    // ignore: unused_element
    this.description,
  });

  @override
  State<_AddOnWidget> createState() => _AddOnWidgetState();
}

class _AddOnWidgetState extends State<_AddOnWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (widget.onChanged != null) {
                widget.onChanged!(widget.selected, widget.selected);
              }
            },
            child: Icon(
              widget.selected ? Icons.add_box : Icons.add_box_outlined,
              color: blackColor,
            ),
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
              onChanged: (_) {
                if (widget.onChanged != null) {
                  widget.onChanged!(widget.selected, widget.selected);
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
