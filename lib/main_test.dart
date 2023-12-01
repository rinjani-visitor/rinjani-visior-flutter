import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/constant/country.dart';
import 'package:rinjani_visitor/page/review/write_review_dialog.dart';
import 'package:rinjani_visitor/core/presentation/widget/form/dropdown_textfield.dart';

void main() {
  // Force google font to use offline fonts instead of re-downloading again
  GoogleFonts.config.allowRuntimeFetching = false;

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
    return const CupertinoApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      theme: CupertinoThemeData(
        brightness: Brightness.light,
      ),
      home: WriteReviewPage(""),
    );
  }
}

class DevPage extends StatefulWidget {
  const DevPage({super.key});

  @override
  State<DevPage> createState() => _DevPageState();
}

class _DevPageState extends State<DevPage> {
  TextEditingController countryController = TextEditingController();

  @override
  void dispose() {
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(9),
            child: DropdownTextfield(
                label: "Pilih negara",
                controller: countryController,
                items: countryLists,
                placeholder: "example indeed"),
          ),
        ],
      ),
    );
  }
}
