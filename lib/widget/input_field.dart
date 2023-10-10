import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class InputField extends StatelessWidget {
  final String label;
  final String? placeholder;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final void Function()? onTap;
  final bool secureText;
  const InputField(
      {Key? key,
      required this.label,
      this.secureText = false,
      this.placeholder,
      this.controller,
      this.onChanged,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label',
          style: blackTextStyle.copyWith(fontSize: 14, fontWeight: semibold),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          decoration: BoxDecoration(
              color: mediumGray,
              borderRadius: BorderRadius.circular(smallRadius),
              border: Border.all(color: lightGray)),
          child: CupertinoTextFormFieldRow(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: onChanged,
            controller: controller,
            placeholder: placeholder,
            obscureText: secureText,
            onTap: onTap,
          ),
        )
      ],
    );
  }
}
