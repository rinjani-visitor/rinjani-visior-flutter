import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/core/constant/country.dart';
import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/authentication/domain/auth_model.dart';
import 'package:rinjani_visitor/features/authentication/presentation/auth_riverpod.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/button/primary_button.dart';
import 'package:rinjani_visitor/widget/form/dropdown_textfield.dart';
import 'package:rinjani_visitor/widget/input_field.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final usernameTxtController = TextEditingController();
  final emailTxtController = TextEditingController();
  final countryTxtController = TextEditingController();
  final phoneNumberTxtController = TextEditingController();
  final passwordTxtController = TextEditingController();

  @override
  void dispose() {
    usernameTxtController.dispose();
    emailTxtController.dispose();
    phoneNumberTxtController.dispose();
    passwordTxtController.dispose();
    countryTxtController.dispose();
    super.dispose();
  }

  void _toLogin() {
    Navigator.pushReplacementNamed(context, '/login-page');
  }

  void _onFormSubmit() async {
    await ref.read(authControllerProvider.notifier).register(
        usernameTxtController.text,
        emailTxtController.text,
        countryTxtController.text,
        phoneNumberTxtController.text,
        passwordTxtController.text,
        passwordTxtController.text);
    if (ref.read(authControllerProvider).hasValue) {
      _toLogin();
    }
    Fluttertoast.showToast(
        msg: ref.read(authControllerProvider).asError!.error.toString());
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: whiteColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                inputSection(),
                SizedBox(
                  height: 36,
                ),
                signUpButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

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
        DropdownTextfield(
          label: "Country",
          controller: countryTxtController,
          placeholder: "Eg: Vatikan",
          items: countryLists,
        ),
        SizedBox(
          height: 12,
        ),
        InputField(label: 'Username'),
        SizedBox(
          height: 12,
        ),
        InputField(label: 'Email'),
        SizedBox(
          height: 12,
        ),
        InputField(
          label: 'Phone number',
          keyboardType: TextInputType.phone,
        ),
        SizedBox(
          height: 12,
        ),
        InputField(label: 'Password', secureText: true)
      ],
    );
  }

  Widget signUpButton() {
    return LoginButton(
        onPressed: () {
          _onFormSubmit();
        },
        isLoading: ref.watch(authControllerProvider).isLoading,
        child: Text(
          'Sign Up',
        ));
  }
}
