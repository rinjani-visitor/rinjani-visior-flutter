import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/auth_riverpod.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late final _viewModel = ref.read(authRiverpodProvider.notifier);
  late var _state = ref.read(authRiverpodProvider);

  @override
  void initState() {
    super.initState();
    debugPrint("${_state.asData?.value.toString()}");
    _viewModel.getToken().then((token) {
      if (token.isNotEmpty) {
        debugPrint("value $token");
        Navigator.pushReplacementNamed(context, '/home');
        return;
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _state = ref.watch(authRiverpodProvider);
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
