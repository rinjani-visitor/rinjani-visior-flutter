import 'package:flutter/material.dart';

class MTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;

  const MTextFormField({super.key, this.hintText = "", this.labelText = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        TextFormField(
          decoration: _mInputDecoration(hintText, context)
        ),
      ],
    );
  }
}

InputDecoration _mInputDecoration(String hintText, BuildContext context) =>
    InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
        filled: true,
        fillColor: Theme.of(context).colorScheme.background,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.never);
