import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/features/authentication/presentation/auth_view_model.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class UserSettingPage extends ConsumerStatefulWidget {
  const UserSettingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<UserSettingPage> createState() => _UserSettingPageState();
}

class _UserSettingPageState extends ConsumerState<UserSettingPage> {
  late final _viewModel = ref.read(authViewModelProvider.notifier);
  late final _state = ref.watch(authViewModelProvider);

  void _logOutMethod(void Function() onLoggingOut) async {
    await _viewModel.logOut();
    if (_state.hasError) {
      Fluttertoast.showToast(msg: "${_state.error?.toString()}");
      return;
    }
    onLoggingOut();
  }

  @override
  Widget build(BuildContext context) {
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
                                _logOutMethod(() =>
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        '/login-page', (route) => false));
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
