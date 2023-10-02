import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

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
            child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                //package profile pict
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
                  style:
                      blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
                )
              ],
            ),
          ),
        )));
  }
}
