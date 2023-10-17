import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/core/extension/validator.dart';
import 'package:rinjani_visitor/features/authentication/presentation/auth_riverpod.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/input_field.dart';
import 'package:rinjani_visitor/widget/button/primary_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {

  bool isLoading = false;
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
    await ref.read(authControllerProvider.notifier).logIn(email, pass);
    if (ref.read(authControllerProvider).hasError) {
      Fluttertoast.showToast(
          msg:
              "Error occured: ${ref.read(authControllerProvider).asError?.error.toString()}");
      return;
    }
    debugPrint(
        "LoginPage: result ${ref.read(authControllerProvider).value.toString()}");
    _toHome();
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
            const Spacer(),
            Divider(
              color: blackColor,
            ),
            const Spacer(),
            Column(
              children: [googleLogin(), _signUpButton()],
            ),
            const Spacer(),
            PrimaryButton(
                isLoading: ref.watch(authControllerProvider).isLoading,
                onPressed: () {
                  _submitForm();
                },
                child: const Text("Log in")),
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
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InputFormField(
              label: 'Email',
              secureText: false,
              placeholder: "your@email.com",
              validator: (val) {
                if(val == null || val.length == 0) {
                  return "this field mustn't be empty";
                }
                if(!val.isEmailValid()) {
                  return "not valid email";
                }
                return null;
              },
              controller: emailTxtController),
          const SizedBox(
            height: 12,
          ),
          InputFormField(
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
      ),
    );
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
              Navigator.pushNamed(context, '/register-page');
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
