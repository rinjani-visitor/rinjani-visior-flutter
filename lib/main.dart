import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rinjani_visitor/core/theme/theme.dart';

void main() {

  GoogleFonts.config.allowRuntimeFetching = false;

  // setup license fonts
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  } );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;
    return MaterialApp(
      title: 'Rinjani Visitor',
      theme: rinjaniTheme(textTheme),
      home: const DevScreen(title: 'Dev Screen'),
    );
  }
}

class DevScreen extends StatefulWidget {
  const DevScreen({super.key, required this.title});

  final String title;

  @override
  State<DevScreen> createState() => _DevScreenState();
}

class _DevScreenState extends State<DevScreen> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text("Dev Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FilledButton(onPressed: () {},
                child: Text("Wu Huahai")),
            FilledButton.tonal(onPressed: (){}, child: Text("Yokshire")),
            OutlinedButton(onPressed: (){}, child: Text("Michigan")),
            TextButton(onPressed: (){}, child: Text("Dafeng"))
          ],
        ),
      ),
    );
  }
}
