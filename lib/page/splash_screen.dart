import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/authentication/presentation/auth_riverpod.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(AuthRiverpod.provider).getToken().then((value) {
      if (value is LocalResult && value.data != null) {
        debugPrint("value $value");
        Navigator.pushReplacementNamed(context, '/login-page');
        return;
      }
      Navigator.pushReplacementNamed(context, '/home-page');
    });
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
              height: 66,
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
