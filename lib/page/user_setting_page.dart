import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/features/authentication/presentation/auth_riverpod.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class UserSettingPage extends ConsumerWidget {
  const UserSettingPage({Key? key}) : super(key: key);

  void _logOutMethod(WidgetRef ref, void Function() onLoggingOut) async {
    await ref.read(authControllerProvider.notifier).logOut();
    if (ref.read(authControllerProvider).hasError) {
      Fluttertoast.showToast(
          msg: "${ref.read(authControllerProvider).error?.toString()}");
      return;
    }
    onLoggingOut();
  }

  @override
  Widget build(BuildContext context, ref) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Account settings'),
        ),
        backgroundColor: backgroundColor,
        child: SafeArea(
            child: Container(
          height: 690,
          margin: EdgeInsets.only(top: 16),
          child: Column(
            children: [
              CupertinoListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/change-pass-page');
                },
                backgroundColor: whiteColor,
                leading: Icon(
                  Icons.lock,
                  color: blackColor,
                ),
                title: Text('Change password'),
                trailing: Icon(
                  Icons.chevron_right,
                  color: blackColor,
                ),
              ),
              CupertinoListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/change-email-page');
                },
                backgroundColor: whiteColor,
                leading: Icon(
                  Icons.mail,
                  color: blackColor,
                ),
                title: Text('Change Email'),
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
                                _logOutMethod(
                                    ref,
                                    () => Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        '/login-page',
                                        (route) => false));
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
