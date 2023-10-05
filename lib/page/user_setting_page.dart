import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class UserSettingPage extends StatelessWidget {
  const UserSettingPage({Key? key}) : super(key: key);

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
              Spacer(),
              TextButton(
                onPressed: () {
                  //fungsi log out di sini
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
