import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/features/authentication/presentation/auth_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

class UserSettingPage extends ConsumerStatefulWidget {
  const UserSettingPage({super.key});

  @override
  ConsumerState<UserSettingPage> createState() => _UserSettingPageState();
}

class _UserSettingPageState extends ConsumerState<UserSettingPage> {
  late final _viewModel = ref.read(authRiverpodProvider.notifier);

  void _logOutMethod(void Function() onLoggingOut) async {
    await _viewModel.logOut();
    final state = ref.read(authRiverpodProvider);
    if (state.hasError) {
      Fluttertoast.showToast(msg: "${state.error?.toString()}");
      return;
    }
    onLoggingOut();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Account settings'),
        ),
        backgroundColor: backgroundColor,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              CupertinoListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/personal/pass');
                },
                backgroundColor: whiteColor,
                leading: Icon(
                  Icons.lock,
                  color: blackColor,
                ),
                title: const Text('Change password'),
                trailing: Icon(
                  Icons.chevron_right,
                  color: blackColor,
                ),
              ),
              CupertinoListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/personal/pass');
                },
                backgroundColor: whiteColor,
                leading: Icon(
                  Icons.mail,
                  color: blackColor,
                ),
                title: const Text('Change Email'),
                trailing: Icon(
                  Icons.chevron_right,
                  color: blackColor,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: const Text('Account Logout'),
                          content:
                              const Text('Are you sure you want to logout?'),
                          actions: [
                            CupertinoDialogAction(
                              child: const Text("No"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text(
                                "Yes",
                                style:
                                    redTextStyle.copyWith(fontSize: subtitle1),
                              ),
                              onPressed: () {
                                //fungsi logout booking taruh di sini
                                _logOutMethod(() =>
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, '/login', (route) => false));
                              },
                            ),
                          ],
                        );
                      });
                },
                child: Text(
                  'Log out',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: errorRed,
                      fontSize: 16),
                ),
              )
            ],
          ),
        )));
  }
}
