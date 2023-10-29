import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/page/booking/booking_detail_page.dart';
import 'package:rinjani_visitor/page/profile/change_email_page.dart';
import 'package:rinjani_visitor/page/profile/change_pass_page.dart';
import 'package:rinjani_visitor/page/continue_payment_page.dart';
import 'package:rinjani_visitor/page/booking/detail_page.dart';
import 'package:rinjani_visitor/page/event_detail.dart';
import 'package:rinjani_visitor/page/auth/login_page.dart';
import 'package:rinjani_visitor/page/main/main_page.dart';
import 'package:rinjani_visitor/page/notification_page.dart';
import 'package:rinjani_visitor/page/profile/personal_info_page.dart';
import 'package:rinjani_visitor/page/auth/register_page.dart';
import 'package:rinjani_visitor/page/search_page.dart';
import 'package:rinjani_visitor/page/splash_screen.dart';
import 'package:rinjani_visitor/page/booking/success_booking_page.dart';
import 'package:rinjani_visitor/page/booking/success_offer_page.dart';
import 'package:rinjani_visitor/page/profile/user_setting_page.dart';

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
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const MainPage(),
        '/search': (context) => const SearchPage(),
        '/event-detail': (context) => const EventDetail(),
        '/notification': (context) => const NotificationPage(),
        '/personal-info': (context) => const PersonalInfoPage(),
        '/user-setting': (context) => const UserSettingPage(),
        '/change-pass': (context) => const ChangePassPage(),
        '/change-email': (context) => const ChangeEmailPage(),
        '/detail': (context) => const DetailPage(),
        '/booking-detail': (context) => const BookingDetailPage(),
        '/success-booking': (context) => const SuccessBookingPage(),
        '/success-offer': (context) => const SuccessOfferPage(),
        '/continue-payment': (context) => const ContinuePaymentPage(),
      },
    );
  }
}
