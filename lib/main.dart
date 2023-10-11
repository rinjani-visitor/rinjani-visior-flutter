import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/page/category_explore_page.dart';
import 'package:rinjani_visitor/page/change_email_page.dart';
import 'package:rinjani_visitor/page/change_pass_page.dart';
import 'package:rinjani_visitor/page/detail_page.dart';
import 'package:rinjani_visitor/page/event_detail.dart';
import 'package:rinjani_visitor/page/login_page.dart';
import 'package:rinjani_visitor/page/main_page.dart';
import 'package:rinjani_visitor/page/notification_page.dart';
import 'package:rinjani_visitor/page/personal_info_page.dart';
import 'package:rinjani_visitor/page/register_page.dart';
import 'package:rinjani_visitor/page/search_page.dart';
import 'package:rinjani_visitor/page/splash_screen.dart';
import 'package:rinjani_visitor/page/success_booking_page.dart';
import 'package:rinjani_visitor/page/success_offer_page.dart';
import 'package:rinjani_visitor/page/user_setting_page.dart';

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
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/login-page': (context) => const LoginPage(),
        '/register-page': (context) => const RegisterPage(),
        '/home-page': (context) => const MainPage(),
        '/search-page': (context) => const SearchPage(),
        '/event-detail-page': (context) => const EventDetail(),
        '/detail-page': (context) => const DetailPage(),
        '/notification-page': (context) => const NotificationPage(),
        '/personal-info-page': (context) => const PersonalInfoPage(),
        '/user-setting-page': (context) => const UserSettingPage(),
        '/change-pass-page': (context) => const ChangePassPage(),
        '/change-email-page': (context) => const ChangeEmailPage(),
        '/success-booking-page': (context) => const SuccessBookingPage(),
        '/success-offer-page': (context) => const SuccessOfferPage(),
      },
    );
  }
}
