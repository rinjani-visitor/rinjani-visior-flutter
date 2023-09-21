import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/page/home_page.dart';
import 'package:rinjani_visitor/page/login_page.dart';
import 'package:rinjani_visitor/page/main_page.dart';
import 'package:rinjani_visitor/page/register_page.dart';
import 'package:rinjani_visitor/page/splash_screen.dart';

void main() {
  // Force google font to use offline fonts instead of re-downloading again
  GoogleFonts.config.allowRuntimeFetching = false;

  // setup license fonts
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      routes: {
        '/': (context) => const SplashScreen(),
        '/login-page': (context) => const LoginPage(),
        '/sign-up': (context) => const RegisterPage(),
        '/home-page': (context) => const MainPage()
      },
    );
  }
}
