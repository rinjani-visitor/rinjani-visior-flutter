import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class CancelButtonWidget extends StatelessWidget {
  const CancelButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: const Text('Cancel booking'),
                  content: const Text('Are you sure to cancel this booking?'),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text("No"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text(
                        "Yes",
                        style: redTextStyle.copyWith(fontSize: subtitle1),
                      ),
                      onPressed: () {
                        //fungsi cancel booking taruh di sini

                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
        },
        child: Text(
          'Cancel this booking',
          style: redTextStyle.copyWith(
              fontSize: 12, decoration: TextDecoration.underline),
        ));
  }
}
