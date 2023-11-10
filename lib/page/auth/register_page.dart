import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/core/constant/country.dart';
import 'package:rinjani_visitor/core/extension/validator.dart';
import 'package:rinjani_visitor/features/authentication/presentation/auth_riverpod.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/button/primary_button.dart';
import 'package:rinjani_visitor/widget/form/dropdown_textfield.dart';
import 'package:rinjani_visitor/widget/input_field.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _usernameTxtController = TextEditingController();
  final _emailTxtController = TextEditingController();
  final _countryTxtController = TextEditingController();
  final _phoneNumberTxtController = TextEditingController();
  final _passwordTxtController = TextEditingController();

  late final _viewModel = ref.read(authRiverpodProvider.notifier);
  late var _state = ref.read(authRiverpodProvider);

  @override
  void dispose() {
    _usernameTxtController.dispose();
    _emailTxtController.dispose();
    _phoneNumberTxtController.dispose();
    _passwordTxtController.dispose();
    _countryTxtController.dispose();
    super.dispose();
  }

  void _toLogin() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  void _onFormSubmit() async {
    await _viewModel.register(
        _usernameTxtController.text,
        _emailTxtController.text,
        _countryTxtController.text,
        _phoneNumberTxtController.text,
        _passwordTxtController.text,
        _passwordTxtController.text);
    if (_state.hasError) {
      Fluttertoast.showToast(msg: _state.asError!.error.toString());
      return;
    }
    _toLogin();
  }

  @override
  Widget build(BuildContext context) {
    _state = ref.watch(authRiverpodProvider);
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
                const SizedBox(
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
      margin: const EdgeInsets.only(top: 24, bottom: 32),
      child: Text(
        "Let's start your\njourney with us",
        style: blackTextStyle.copyWith(fontSize: 32, fontWeight: bold),
      ),
    );
  }

  Widget inputSection() {
    return Form(
      child: Column(
        children: [
          DropdownTextfield(
            label: "Country",
            controller: _countryTxtController,
            placeholder: "Eg: Vatikan",
            items: countryLists,
          ),
          const SizedBox(
            height: 12,
          ),
          InputFormField(
            label: 'Username',
            controller: _usernameTxtController,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Username required";
              }
              return null;
            },
          ),
          InputFormField(
            label: 'Email',
            controller: _emailTxtController,
            textInputAction: TextInputAction.next,
            autoFillHints: const [AutofillHints.email],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email required";
              }
              if (!value.isEmailValid()) {
                return "Not valid email";
              }
              return null;
            },
          ),
          InputFormField(
            label: 'Phone number',
            placeholder: "Same as your Whatsapp",
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            controller: _phoneNumberTxtController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Phone number required";
              }
              return null;
            },
          ),
          InputFormField(
            label: 'Password',
            secureText: true,
            textInputAction: TextInputAction.done,
            controller: _passwordTxtController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password required";
              }
              if (value.length < 8) {
                return "Password must have 8 characters minimum";
              }
              return null;
            },
          )
        ],
      ),
    );
  }

  Widget signUpButton() {
    return PrimaryButton(
        onPressed: () {
          _onFormSubmit();
        },
        isLoading: _state.isLoading,
        child: const Text(
          'Sign Up',
        ));
  }
}
