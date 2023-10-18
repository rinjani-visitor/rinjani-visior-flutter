import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class InputField extends StatelessWidget {
  final String? label;
  final String? placeholder;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final void Function()? onTap;
  final bool secureText;
  const InputField(
      {Key? key,
      this.label,
      this.secureText = false,
      this.placeholder,
      this.controller,
      this.onChanged,
      this.keyboardType,
      this.onTap,
      this.errorText})
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
          decoration: BoxDecoration(
              color: mediumGray,
              borderRadius: BorderRadius.circular(smallRadius),
              border: Border.all(
                color: lightGray,
              )),
          padding: const EdgeInsets.all(12.0),
          onChanged: (value) {
            if (onChanged != null) {
              onChanged!(value);
            }
          },
          controller: controller,
          placeholder: placeholder,
          obscureText: secureText,
          keyboardType: keyboardType,
          onTap: onTap,
        ),
      ],
    );
  }
}

class InputFormField extends FormField<String> {
  InputFormField(
      {super.key,
      String label = "",
      bool secureText = false,
      String? placeholder,
      TextEditingController? controller,
      void Function(String value)? onChanged,
      TextInputType? keyboardType,
      void Function()? onTap,
      void Function(String?)? onSaved,
      String? Function(String?)? validator,
      String initialValue = "",
      AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction})
      : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            builder: (FormFieldState<String> state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputField(
                    controller: controller,
                    keyboardType: keyboardType,
                    label: label,
                    secureText: secureText,
                    onTap: onTap,
                    onChanged: (value) {
                      state.didChange(value);
                    },
                    placeholder: placeholder,
                  ),
                  Text(
                    (state.hasError ? state.errorText : "") ?? "",
                    style: redTextStyle.copyWith(fontSize: body3),
                  )
                ],
              );
            });
}
