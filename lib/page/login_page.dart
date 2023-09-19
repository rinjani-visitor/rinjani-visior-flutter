import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/input_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 24, bottom: 32),
        child: Text(
          "Let's start your\njourney with us",
          style: blackTextStyle.copyWith(fontSize: 32, fontWeight: bold),
        ),
      );
    }

    Widget inputSection() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InputField(label: 'Email', secureText: false),
          const SizedBox(
            height: 12,
          ),
          InputField(label: 'Password', secureText: true),
          const SizedBox(
            height: 12,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home-page');
              },
              child: Text(
                "Forgot your password?",
                style:
                    blackTextStyle.copyWith(fontSize: 12, fontWeight: semibold),
              ))
        ],
      );
    }

    Widget actionButton() {
      return TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home-page');
          },
          child: Container(
            width: 357,
            height: 43,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(smallRadius)),
            child: Center(
                child: Text(
              'Log In',
              style:
                  whiteTextStyle.copyWith(fontSize: 18, fontWeight: semibold),
            )),
          ));
    }

    Widget signUpButton() {
      return Row(
        children: [
          Text(
            "Doesn't have an account?",
            style: blackTextStyle.copyWith(fontSize: 12, fontWeight: medium),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sign-up');
              },
              child: Text(
                "Sign Up",
                style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: semibold,
                    decoration: TextDecoration.underline),
              )),
        ],
      );
    }

    Widget googleLogin() {
      return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(smallRadius),
              color: mediumGray,
              border: Border.all(color: lightGray, width: 1)),
          child: TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Google.png'))),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'Login with Google',
                  style: blackTextStyle.copyWith(
                      fontSize: 14, fontWeight: semibold),
                )
              ],
            ),
          ));
    }

    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            inputSection(),
            const SizedBox(
              height: 48,
            ),
            Divider(
              color: blackColor,
            ),
            const SizedBox(
              height: 48,
            ),
            googleLogin(),
            // const LoginGoogle(),
            SizedBox(
              height: 24,
            ),
            signUpButton(),
            const Spacer(),
            actionButton(),
          ],
        ),
      )),
    );
  }
}
