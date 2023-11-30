import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/page/main/booking/booking_history_page.dart';
import 'package:rinjani_visitor/page/auth/forgot_password.dart';
import 'package:rinjani_visitor/page/booking/booking_detail_page.dart';
import 'package:rinjani_visitor/page/account/settings/change_email_page.dart';
import 'package:rinjani_visitor/page/account/settings/change_pass_page.dart';
import 'package:rinjani_visitor/page/booking/booking_status_page.dart';
import 'package:rinjani_visitor/page/booking/continue_payment_page.dart';
import 'package:rinjani_visitor/page/main/event/event_detail_page.dart';
import 'package:rinjani_visitor/page/auth/login_page.dart';
import 'package:rinjani_visitor/page/main/main_page.dart';
import 'package:rinjani_visitor/page/main/home/notification/notification_page.dart';
import 'package:rinjani_visitor/page/account/personal_info_page.dart';
import 'package:rinjani_visitor/page/auth/register_page.dart';
import 'package:rinjani_visitor/page/main/search_page.dart';
import 'package:rinjani_visitor/page/splash_screen.dart';
import 'package:rinjani_visitor/page/booking/offer_status_page.dart';
import 'package:rinjani_visitor/page/account/account_settings_page.dart';

void main() {
  // Force google font to use offline fonts instead of re-downloading again
  GoogleFonts.config.allowRuntimeFetching = false;

  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

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
      debugShowCheckedModeBanner: false,
      title: "Rinjani Visitor",
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: const [Locale("en"), Locale("id")],
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/login/forgot': (context) => const ForgotPasswordPage(),
        '/home': (context) => const MainPage(),
        '/search': (context) => const SearchPage(),
        '/event/detail': (context) => const EventDetailPage(),
        '/notification': (context) => const NotificationPage(),
        '/settings': (context) => const UserSettingPage(),
        '/personal': (context) => const PersonalInfoPage(),
        '/personal/pass': (context) => const ChangePassPage(),
        '/personal/email': (context) => const ChangeEmailPage(),
        '/booking/detail': (context) => const BookingDetailPage(),
        '/booking/submit': (context) => const BookingStatusPage(),
        '/booking/history': (context) => const BookingHistoryPage(),
        '/booking/offer': (context) => const OfferStatusPage(),
        '/booking/payment': (context) => const ContinuePaymentPage(),
      },
    );
  }
}
