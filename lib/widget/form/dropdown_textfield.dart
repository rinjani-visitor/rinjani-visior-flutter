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
          onTap: () => _isTapped = true,
        ),
        //Dropdown Items
        _isTapped && _filteredList.isNotEmpty
            ? Container(
                height: 150.0,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView.builder(
                  itemCount: _filteredList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _isTapped = !_isTapped;
                          widget.controller.text = _filteredList[index];
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(_filteredList[index]),
                      ),
                    );
                  },
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
