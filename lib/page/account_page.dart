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
                Container(
                  width: 100,
                  height: 100,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: lightGray),
                  child: Center(child: Text('h')),
                ),
                SizedBox(
                  height: 8,
                ),
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
