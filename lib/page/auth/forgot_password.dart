import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/core/extension/validator.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/core/widget/button/primary_button.dart';
import 'package:rinjani_visitor/core/widget/form/input_field.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  void pop() {
    Navigator.pop(context);
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final email = _textController.text;
      try {
        final result =
            await ref.read(authViewModelProvider.notifier).resetPassword(email);
        if (result != null && result.contains("Failed")) {
          Fluttertoast.showToast(msg: result, toastLength: Toast.LENGTH_LONG);
          return;
        }
        Fluttertoast.showToast(msg: result!, toastLength: Toast.LENGTH_LONG);
        pop();
      } catch (e) {
        Fluttertoast.showToast(
            msg: e.toString(), toastLength: Toast.LENGTH_LONG);
      }
    }
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
            Container(
              padding: const EdgeInsets.only(top: 24, bottom: 32),
              child: Text(
                "Forgot your\npassword?",
                style: blackTextStyle.copyWith(fontSize: 32, fontWeight: bold),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Enter your email address and we will send you a link to reset your password.",
              style: blackTextStyle.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 16,
            ),
            Form(
              key: _formKey,
              child: InputFormField(
                  controller: _textController,
                  label: 'Email',
                  secureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.isEmailValid()) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  placeholder: ""),
            ),
            PrimaryButton(
                isLoading: ref.watch(authViewModelProvider).isLoading,
                child: Text("Send Link Request"),
                onPressed: () => _submitForm())
          ],
        ),
      )),
    );
  }
}
