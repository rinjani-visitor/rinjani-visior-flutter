import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:rinjani_visitor/page/auth/forgot_password.dart';
import 'package:rinjani_visitor/page/auth/login_page.dart';
import 'package:rinjani_visitor/page/auth/register_page.dart';

@immutable
class LoginScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

@immutable
class RegisterScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RegisterPage();
  }
}

@immutable
class ForgotPasswordScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ForgotPasswordPage();
  }
}
