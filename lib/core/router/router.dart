import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:rinjani_visitor/page/splash_screen.dart';
import 'auth.dart';

part 'router.g.dart';

@TypedGoRoute<SplashScreenRoute>(
    path: "/", routes: [TypedGoRoute<LoginScreenRoute>(path: "login")])
@immutable
class SplashScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreen();
  }
}
