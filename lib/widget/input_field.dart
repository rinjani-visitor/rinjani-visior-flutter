import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class InputField extends StatelessWidget {
  final String label;
  final bool secureText;
  const InputField({Key? key, required this.label, required this.secureText})
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
        CupertinoTextField(
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          decoration: BoxDecoration(
              color: mediumGray,
              borderRadius: BorderRadius.circular(smallRadius),
              border: Border.all(color: lightGray)),
          placeholder: 'your@email.com',
          obscureText: secureText,
        )
      ],
    );
  }
}
