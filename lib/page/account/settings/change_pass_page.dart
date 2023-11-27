import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/widget/form/input_field.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth_detail.dart';

class ChangePassPage extends ConsumerStatefulWidget {
  const ChangePassPage({super.key});

  @override
  ConsumerState<ChangePassPage> createState() => _ChangePassPageState();
}

class _ChangePassPageState extends ConsumerState<ChangePassPage> {
  late final _passwordController = TextEditingController();
  late final _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Change password'),
        ),
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            height: 200,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(smallRadius)),
            child: Column(
              children: [
                const Text(
                  'Enter your email to change your password',
                ),
                SizedBox(
                  width: double.infinity,
                  child: InputFormField(
                    controller: _passwordController,
                    label: 'Password',
                    validator: (value) {
                      // create validation password that is not empty, at least 8 characters, contains uppercase, lowercase, and number
                      if (value!.isEmpty) {
                        return 'Password cannot be empty';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      } else if (!value.contains(RegExp(r'[A-Z]'))) {
                        return 'Password must contain uppercase';
                      } else if (!value.contains(RegExp(r'[a-z]'))) {
                        return 'Password must contain lowercase';
                      } else if (!value.contains(RegExp(r'[0-9]'))) {
                        return 'Password must contain number';
                      }
                      return null;
                    },
                    secureText: true,
                  ),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      ref
                          .read(authDetailViewModelProvider.notifier)
                          .updateUserDetail(
                            password: _passwordController.text,
                            confirmPassword: _passwordController.text,
                          );
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 43,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(smallRadius)),
                      child: Center(
                        child: Text(
                          'Change Password',
                          style: whiteTextStyle.copyWith(
                              fontSize: 16, fontWeight: semibold),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
