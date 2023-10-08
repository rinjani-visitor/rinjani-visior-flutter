import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/authentication/domain/data/remote/response/login_response.dart';
import 'package:rinjani_visitor/features/authentication/presentation/auth_riverpod.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/input_field.dart';
import 'package:rinjani_visitor/widget/button/login_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool isLlogin = false;
  final emailTxtController = TextEditingController();
  final passwordTxtController = TextEditingController();

  @override
  void dispose() {
    emailTxtController.dispose();
    passwordTxtController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void _toHome() {
    Navigator.pushReplacementNamed(context, '/home-page');
  }

  void _submitForm() async {
    final email = emailTxtController.text;
    final pass = passwordTxtController.text;
    final result = await ref.read(AuthController.provider).logIn(email, pass);
    if (result is LocalResult && result.data is LoginResponse) {
      _toHome();
      return;
    }
    Fluttertoast.showToast(msg: "Error occured: ${result.error.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            _inputSection(),
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
            const SizedBox(
              height: 24,
            ),
            _signUpButton(),
            const Spacer(),
            LoginButton(
                child: const Text("Log in"),
                onPressed: () {
                  _submitForm();
                }),
          ],
        ),
      )),
    );
  }

  Widget header() {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 32),
      child: Text(
        "Let's start your\njourney with us",
        style: blackTextStyle.copyWith(fontSize: 32, fontWeight: bold),
      ),
    );
  }

  Widget _inputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InputField(
            label: 'Email',
            secureText: false,
            placeholder: "your@email.com",
            controller: emailTxtController),
        const SizedBox(
          height: 12,
        ),
        InputField(
          controller: passwordTxtController,
          label: 'Password',
          secureText: true,
          placeholder: "your password of course",
        ),
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

  Widget _actionButton() {
    return TextButton(
        onPressed: () {
          _submitForm();
        },
        child: Container(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(smallRadius)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              'Log In',
              style:
                  whiteTextStyle.copyWith(fontSize: 18, fontWeight: semibold),
            )),
          ),
        ));
  }

  Widget _signUpButton() {
    return Row(
      children: [
        Text(
          "Doesn't have an account?",
          style: blackTextStyle.copyWith(fontSize: 12, fontWeight: medium),
        ),
        TextButton(
            onPressed: () {
              _submitForm();
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
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: semibold),
              )
            ],
          ),
        ));
  }
}
