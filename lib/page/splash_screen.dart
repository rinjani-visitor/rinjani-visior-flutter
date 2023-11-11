import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/auth_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late var _state = ref.read(authRiverpodProvider);

  Future<void> syncToken() async {
    final token = _state.asData?.value?.token;
    if (token != null && token.isNotEmpty) {
      debugPrint("value $token");
      Navigator.pushReplacementNamed(context, '/home');
      return;
    }
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  void initState() {
    super.initState();
    debugPrint("${_state.asData?.value.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    _state = ref.watch(authRiverpodProvider);
    if (_state is AsyncData) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        syncToken();
      });
    }
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
