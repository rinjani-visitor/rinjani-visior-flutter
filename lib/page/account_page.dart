import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  Widget userProfile() {
    return Container(
      width: double.infinity,
      height: 144,
      child: Column(
        children: [
          CircularProfileAvatar(
            //code buat akses file di onTap
            onTap: () {},

            child: Image.asset('assets/Google.png'),
            borderColor: mediumGray,
            backgroundColor: lightGray,
            initialsText: Text('AD'),
            '',
          ),
          SizedBox(
            height: 8,
          ),

          //username dari user
          Text(
            'Username',
            style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
          )
        ],
      ),
    );
  }

  Widget information() {
    return Container(
      width: double.infinity,
      height: 138,
      margin: EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Information',
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
          ),
          Column(
            children: [
              CupertinoListTile(
                padding: EdgeInsets.all(0),
                leading: Icon(
                  Icons.person,
                  color: blackColor,
                ),
                title: Text('Personal Information'),
                trailing: Icon(
                  Icons.chevron_right,
                  color: blackColor,
                  size: 32,
                ),
              ),
              Divider(
                color: blackColor,
              ),
              CupertinoListTile(
                padding: EdgeInsets.all(0),
                leading: Icon(
                  Icons.settings,
                  color: blackColor,
                ),
                title: Text('Account settings'),
                trailing: Icon(
                  Icons.chevron_right,
                  color: blackColor,
                  size: 32,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Text(
            'Profile',
            style: blackTextStyle.copyWith(fontSize: 32, fontWeight: semibold),
          ),
        ),
        child: SafeArea(
            child: Container(
          width: double.infinity,
          height: 314,
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            children: [userProfile(), information()],
          ),
        )));
  }
}
