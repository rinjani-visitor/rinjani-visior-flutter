import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/widget/input_field.dart';

class DropdownTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String placeholder;
  final String label;
  final List<String>? items;
  const DropdownTextfield({
    super.key,
    required this.label,
    required this.controller,
    required this.placeholder,
    this.items,
  });

  @override
  State<DropdownTextfield> createState() => _DropdownTextfieldState();
}

class _DropdownTextfieldState extends State<DropdownTextfield> {
  bool _isTapped = false;
  List<String> _list = [];
  List<String> _filteredList = [];
  @override
  void initState() {
    _list = widget.items ?? [];
    _filteredList = _list;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(
          controller: widget.controller,
          label: widget.label,
          placeholder: widget.placeholder,
          onChanged: (value) {
            _filteredList = _list
                .where((element) =>
                    element.toLowerCase().contains(value.toLowerCase()))
                .toList();
          },
        ),
      ],
    );
  }
}
