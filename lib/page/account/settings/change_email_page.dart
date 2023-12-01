import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/presentation/widget/form/input_field.dart';

class ChangeEmailPage extends StatelessWidget {
  const ChangeEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Change Email'),
        ),
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            height: 200,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(smallRadius)),
            child: Column(
              children: [
                const Text(
                  'Enter your email to change your email',
                ),
                const Spacer(),
                const SizedBox(
                    width: double.infinity,
                    child: InputField(label: 'Email', secureText: false)),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      //fungsi change password
                    },
                    child: Container(
                      width: double.infinity,
                      height: 43,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(smallRadius)),
                      child: Center(
                        child: Text(
                          'Change Email',
                          style: whiteTextStyle.copyWith(
                              fontSize: 16, fontWeight: semibold),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
