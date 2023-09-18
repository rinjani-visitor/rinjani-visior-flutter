import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/input_field.dart';
import 'package:rinjani_visitor/widget/login_google.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lets start your\njourney with us',
              style: blackTextStyle.copyWith(fontSize: 32, fontWeight: bold),
            ),
            const SizedBox(
              height: 32,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const InputField(label: "Email", secureText: false),
                const SizedBox(
                  height: 12,
                ),
                const InputField(label: "Password", secureText: true),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Forgot Password?',
                  style: blackTextStyle.copyWith(
                      fontSize: 12, fontWeight: semibold),
                )
              ],
            ),
            SizedBox(
              height: 48,
            ),
            Divider(
              color: blackColor,
            ),
            LoginGoogle(),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text('Dont have account? '),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: blackTextStyle.copyWith(
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                          fontWeight: bold),
                    ))
              ],
            ),
            Spacer(),
            TextButton(
                onPressed: () {},
                child: Container(
                  width: 357,
                  height: 43,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(smallRadius)),
                  child: Center(
                      child: Text(
                    'Log In',
                    style: whiteTextStyle.copyWith(
                        fontSize: 18, fontWeight: semibold),
                  )),
                ))
          ],
        ),
      )),
    );
  }
}
