import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class LoginButton extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final Function onPressed;
  const LoginButton(
      {super.key,
      required this.child,
      this.isLoading = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: isLoading ? null : () => onPressed(),
        child: Container(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          decoration: BoxDecoration(
              color: isLoading ? Colors.grey : primaryColor,
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
                        style: whiteTextStyle.copyWith(
                            fontSize: 18, fontWeight: semibold),
                        child: child)),
          ),
        ));
  }
}
