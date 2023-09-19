import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/input_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
        children: [
          InputField(label: 'Username', secureText: false),
          SizedBox(
            height: 12,
          ),
          InputField(label: 'Email', secureText: false),
          SizedBox(
            height: 12,
          ),
          InputField(label: 'Phone number', secureText: false),
          SizedBox(
            height: 12,
          ),
          InputField(label: 'Password', secureText: false)
        ],
      );
    }

    Widget signUpButton() {
      return TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login-page');
          },
          child: Container(
            width: 357,
            height: 43,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(smallRadius)),
            child: Center(
                child: Text(
              'Sign Up',
              style:
                  whiteTextStyle.copyWith(fontSize: 18, fontWeight: semibold),
            )),
          ));
    }

    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              inputSection(),
              const Spacer(),
              signUpButton()
            ],
          ),
        ),
      ),
    );
  }
}
