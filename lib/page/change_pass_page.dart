import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/input_field.dart';

class ChangePassPage extends StatelessWidget {
  const ChangePassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: CupertinoNavigationBar(
          middle: Text('Change password'),
        ),
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            height: 200,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(smallRadius)),
            child: Column(
              children: [
                Text(
                  'Enter your email to change your password',
                ),
                Spacer(),
                Container(
                    width: double.infinity,
                    child: InputField(label: 'Email', secureText: false)),
                Spacer(),
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
                          'Change Password',
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
