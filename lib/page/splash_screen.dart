import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/login-page');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 148,
              height: 148,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/logo.png'))),
            ),
            Text("RINJANI VISITOR",
                style: whiteTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: extrabold,
                    fontStyle: FontStyle.italic))
          ],
        ),
      ),
    );
  }
}
