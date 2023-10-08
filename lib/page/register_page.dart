import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/authentication/domain/auth_model.dart';
import 'package:rinjani_visitor/features/authentication/presentation/auth_riverpod.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/input_field.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final usernameTxtController = TextEditingController();
  final emailTxtController = TextEditingController();
  final phoneNumberTxtController = TextEditingController();
  final passwordTxtController = TextEditingController();

  @override
  void dispose() {
    usernameTxtController.dispose();
    emailTxtController.dispose();
    phoneNumberTxtController.dispose();
    passwordTxtController.dispose();
    super.dispose();
  }

  void _toLogin() {
    Navigator.pushReplacementNamed(context, '/login-page');
  }

  void _onFormSubmit() async {
    final result = await ref.read(AuthController.provider).register(
        usernameTxtController.text,
        emailTxtController.text,
        "country",
        phoneNumberTxtController.text,
        passwordTxtController.text,
        passwordTxtController.text);
    if (result is LocalResult && result.data is AuthModel) {
      _toLogin();
    }
    Fluttertoast.showToast(msg: result.error.toString());
  }

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
            _onFormSubmit();
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
