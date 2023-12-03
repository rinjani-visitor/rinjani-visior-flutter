import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/presentation/widget/form/input_field.dart';

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
  final OverlayPortalController _tooltipController = OverlayPortalController();
  final _link = LayerLink();
  double? _buttonWidth;
  List<String> _list = [];
  List<String> _filteredList = [];
  @override
  void initState() {
    _list = widget.items ?? [];
    _filteredList = _list;
    super.initState();
  }

  void _updateFilteredList() {
    setState(() {
      _filteredList = _list
          .where((element) => element
              .toLowerCase()
              .contains(widget.controller.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapOutside: (event) {},
      child: CompositedTransformTarget(
        link: _link,
        child: OverlayPortal(
          controller: _tooltipController,
          overlayChildBuilder: (context) {
            return CompositedTransformFollower(
              link: _link,
              targetAnchor: Alignment.bottomLeft,
              child: Align(
                  alignment: AlignmentDirectional.topStart, child: _content()),
            );
          },
          child: InputField(
            controller: widget.controller,
            label: widget.label,
            placeholder: widget.placeholder,
            onChanged: (value) {
              if (!_tooltipController.isShowing) {
                _tooltipController.show();
              }
              debugPrint(
                  "current text: $value, controller text ${widget.controller.text}");
              _updateFilteredList();
            },
            onTap: () => setState(() {
              _buttonWidth = context.size?.width;
              _updateFilteredList();
              _tooltipController.show();
            }),
          ),
        ),
      ),
    );
  }

  Widget _content() {
    return Container(
      height: 150.0,
      width: _buttonWidth,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8.0))),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: _filteredList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                widget.controller.text = _filteredList[index];
                debugPrint("Controller new text ${widget.controller.value}");
                _tooltipController.hide();
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(_filteredList[index]),
            ),
          );
        },
      ),
    );
  }
}
