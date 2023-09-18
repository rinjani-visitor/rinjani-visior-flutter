import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class InputField extends StatelessWidget {
  final String label;
  final bool secureText;
  const InputField({Key? key, required this.label, required this.secureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${label}',
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: semibold),
          ),
          SizedBox(
            height: 4,
          ),
          TextField(
            obscureText: secureText,
            decoration: InputDecoration(
                fillColor: lightGray,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(smallRadius),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                    borderRadius: BorderRadius.circular(smallRadius))),
          )
        ],
      ),
    );
  }
}
