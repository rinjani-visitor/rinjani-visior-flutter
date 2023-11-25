import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

class PrimaryButton extends StatelessWidget {
  final bool isLoading;
  final bool isDisabled;
  final Widget child;
  final Function onPressed;
  const PrimaryButton(
      {super.key,
      required this.child,
      this.isDisabled = false,
      this.isLoading = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
        onPressed: isLoading || isDisabled ? null : () => onPressed(),
        child: Container(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          decoration: BoxDecoration(
              color: isLoading || isDisabled ? Colors.grey : primaryColor,
              borderRadius: BorderRadius.circular(smallRadius)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: isLoading
                    ? const SizedBox(
                        width: 27,
                        height: 27,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : DefaultTextStyle.merge(
                        style: isDisabled
                            ? grayTextStyle.copyWith(
                                fontSize: 18, fontWeight: semibold)
                            : whiteTextStyle.copyWith(
                                fontSize: 18, fontWeight: semibold),
                        child: child)),
          ),
        ));
  }
}
