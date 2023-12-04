import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/core/exception/exception.dart';
import 'package:rinjani_visitor/core/extension/validator.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/presentation/widget/form/input_field.dart';
import 'package:rinjani_visitor/core/presentation/widget/button/primary_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  late final notifier = ref.read(authViewModelProvider.notifier);
  bool _isPasswordVisible = false;

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
    Navigator.pushReplacementNamed(context, '/home');
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final email = emailTxtController.text;
      final pass = passwordTxtController.text;
      debugPrint("$email, $pass");
      await notifier.logIn(email, pass);
      final state = ref.read(authViewModelProvider);
      if (state.hasError || state.hasValue == false) {
        if (state.error is ExtException) {
          final ext = state.error as ExtException;
          Fluttertoast.showToast(msg: "Login failed: ${ext.errorMessage}");
          return;
        }
        Fluttertoast.showToast(msg: "Login failed: ${state.error?.toString()}");
        return;
      }
      debugPrint("LoginPage: result ${state.value.toString()}");
      _toHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authViewModelProvider);
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
            Divider(
              color: blackColor,
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: [
                // googleLogin(),
                _signUpButton(),
              ],
            ),
            const Spacer(),
            PrimaryButton(
                isLoading: state.isLoading,
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
      key: _formKey,
      child: AutofillGroup(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InputFormField(
                label: 'Email',
                secureText: false,
                placeholder: "your@email.com",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autoFillHints: const [
                  AutofillHints.email,
                  AutofillHints.username
                ],
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Email required";
                  }
                  if (!val.isEmailValid()) {
                    return "not valid email";
                  }
                  return null;
                },
                controller: emailTxtController),
            InputFormField(
              controller: passwordTxtController,
              label: 'Password',
              secureText: !_isPasswordVisible,
              suffix: IconButton(
                icon: Icon(
                  _isPasswordVisible
                      ? CupertinoIcons.eye
                      : CupertinoIcons.eye_slash,
                  color: blackColor,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              autoFillHints: const [AutofillHints.password],
              placeholder: "your password of course",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password required";
                }
                if (value.length < 8) {
                  return "password must have 8 characters minimum";
                }
                return null;
              },
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login/forgot');
                },
                child: Text(
                  "Forgot your password?",
                  style: blackTextStyle.copyWith(
                      fontSize: 12, fontWeight: semibold),
                ))
          ],
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return Row(
      children: [
        Text(
          "Don't have an account?",
          style: blackTextStyle.copyWith(fontSize: 12, fontWeight: medium),
        ),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
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

  // Widget googleLogin() {
  //   return Container(
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(smallRadius),
  //           color: mediumGray,
  //           border: Border.all(color: lightGray, width: 1)),
  //       child: TextButton(
  //         onPressed: () {},
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Container(
  //               width: 36,
  //               height: 36,
  //               decoration: const BoxDecoration(
  //                   image: DecorationImage(
  //                       image: AssetImage('assets/Google.png'))),
  //             ),
  //             const SizedBox(
  //               width: 16,
  //             ),
  //             Text(
  //               'Login with Google',
  //               style:
  //                   blackTextStyle.copyWith(fontSize: 14, fontWeight: semibold),
  //             )
  //           ],
  //         ),
  //       ));
  // }
}
