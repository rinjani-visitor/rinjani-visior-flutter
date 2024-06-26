import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/core/extension/validator.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/presentation/widget/button/primary_button.dart';
import 'package:rinjani_visitor/core/presentation/widget/form/input_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 24, bottom: 32),
                  child: Text(
                    "Let's start your\njourney with us",
                    style:
                        blackTextStyle.copyWith(fontSize: 32, fontWeight: bold),
                  ),
                ),
                const _FormBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FormBody extends ConsumerStatefulWidget {
  const _FormBody();

  @override
  ConsumerState<_FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends ConsumerState<_FormBody> {
  final formkey = GlobalKey<FormState>();
  final _usernameTxtController = TextEditingController();
  final _emailTxtController = TextEditingController();
  final _countryTxtController = TextEditingController();
  final _passwordTxtController = TextEditingController();
  final _confirmPasswordTxtController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isRepeatedPasswordVisible = false;

  late final authNotifier = ref.read(authViewModelProvider.notifier);

  @override
  void dispose() {
    _usernameTxtController.dispose();
    _emailTxtController.dispose();
    _countryTxtController.dispose();
    _passwordTxtController.dispose();
    _confirmPasswordTxtController.dispose();
    super.dispose();
  }

  void _toLogin() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  void _onFormSubmit() async {
    if (!formkey.currentState!.validate()) {
      return;
    }
    await authNotifier.register(
        _usernameTxtController.text,
        _emailTxtController.text,
        _countryTxtController.text,
        _passwordTxtController.text,
        _confirmPasswordTxtController.text);

    final state = ref.read(authViewModelProvider);

    if (state.hasError) {
      Fluttertoast.showToast(msg: state.asError!.error.toString());
      return;
    }
    _toLogin();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authViewModelProvider);

    return Form(
      key: formkey,
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              showCountryPicker(
                  showSearch: false,
                  countryListTheme: CountryListThemeData(
                    bottomSheetHeight: 400,
                    inputDecoration: InputDecoration(
                        labelText: 'Search',
                        hintText: 'Start typing to search',
                        fillColor: mediumGray,
                        hoverColor: mediumGray,
                        focusColor: mediumGray,
                        prefixIcon: const Icon(Icons.search),
                        contentPadding: const EdgeInsets.all(4),
                        border: OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius: BorderRadius.circular(smallRadius),
                          borderSide: const BorderSide(
                            color: lightGray,
                          ),
                        )),
                  ),
                  context: context,
                  onSelect: (country) {
                    _countryTxtController.text = country.name;
                  });
            },
            child: InputFormField(
              label: "Country",
              controller: _countryTxtController,
              enabled: false,
              onTap: () {},
              textInputAction: TextInputAction.next,
              placeholder: "Eg: Vatikan",
            ),
          ),
          InputFormField(
            label: 'Your name',
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
            label: 'Password',
            secureText: !_isPasswordVisible,
            textInputAction: TextInputAction.done,
            controller: _passwordTxtController,
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
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password cannot be empty';
              } else if (value.length < 8) {
                return 'Password must be at least 8 characters, contain uppercase, lowercase, number, and special character';
              } else if (!value.contains(RegExp(r'[A-Z]'))) {
                return 'Password must be at least 8 characters, contain uppercase, lowercase, number, and special character';
              } else if (!value.contains(RegExp(r'[a-z]'))) {
                return 'Password must be at least 8 characters, contain uppercase, lowercase, number, and special character';
              } else if (!value.contains(RegExp(r'[0-9]'))) {
                return 'Password must be at least 8 characters, contain uppercase, lowercase, number, and special character';
              } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                return 'Password must be at least 8 characters, contain uppercase, lowercase, number, and special character';
              }
              return null;
            },
          ),
          InputFormField(
            label: 'Confirm password',
            secureText: !_isRepeatedPasswordVisible,
            textInputAction: TextInputAction.done,
            controller: _confirmPasswordTxtController,
            suffix: IconButton(
              icon: Icon(
                _isRepeatedPasswordVisible
                    ? CupertinoIcons.eye
                    : CupertinoIcons.eye_slash,
                color: blackColor,
              ),
              onPressed: () {
                setState(() {
                  _isRepeatedPasswordVisible = !_isRepeatedPasswordVisible;
                });
              },
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password required";
              }
              if (_passwordTxtController.text.compareTo(value) != 0) {
                return "Password should be same";
              }
              return null;
            },
          ),
          PrimaryButton(
              onPressed: () => _onFormSubmit(),
              isLoading: state.isLoading,
              child: const Text(
                'Sign Up',
              ))
        ],
      ),
    );
  }
}
