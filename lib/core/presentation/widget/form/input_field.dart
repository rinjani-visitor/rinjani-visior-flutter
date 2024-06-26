import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

class InputField extends StatelessWidget {
  final String? label;
  final String? placeholder;
  final String? errorText;
  final Widget? prefix;
  final Widget? suffix;
  final Iterable<String>? autoFillHints;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final void Function(String value)? onSubmitted;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final bool secureText;
  final bool? enabled;
  final bool? readOnly;

  const InputField({
    super.key,
    this.label,
    this.secureText = false,
    this.placeholder,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.autoFillHints,
    this.onTap,
    this.errorText,
    this.textInputAction,
    this.inputFormatters,
    this.enabled,
    this.prefix,
    this.suffix,
    this.onSubmitted,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(
                '$label',
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: semibold),
              )
            : const SizedBox(),
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
          autofillHints: autoFillHints,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          onSubmitted: onSubmitted,
          onTap: onTap,
          enabled: enabled ?? true,
          prefix: prefix,
          suffix: suffix,
          readOnly: readOnly ?? false,
        ),
      ],
    );
  }
}

class InputFormField extends FormField<String> {
  InputFormField(
      {super.key,
      String? label,
      Widget? prefix,
      Widget? suffix,
      String super.initialValue = "",
      bool secureText = false,
      bool? enabled,
      String? placeholder,
      TextEditingController? controller,
      List<TextInputFormatter>? inputFormatters,
      TextInputAction? textInputAction,
      TextInputType? keyboardType,
      Iterable<String>? autoFillHints,
      void Function(String value)? onChanged,
      void Function()? onTap,
      super.onSaved,
      super.validator,
      AutovalidateMode super.autovalidateMode =
          AutovalidateMode.onUserInteraction})
      : super(builder: (FormFieldState<String> state) {
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
                autoFillHints: autoFillHints,
                textInputAction: textInputAction,
                inputFormatters: inputFormatters,
                enabled: enabled,
                prefix: prefix,
                suffix: suffix,
              ),
              Text(
                (state.hasError ? state.errorText : "") ?? "",
                style: redTextStyle.copyWith(fontSize: body3),
              )
            ],
          );
        });
}
