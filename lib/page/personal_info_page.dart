import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  Widget userInfo(String label, String info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$label',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(bottom: 8),
                height: 43,
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(smallRadius)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$info',
                    ),
                  ],
                ))
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: CupertinoNavigationBar(
          middle: Text('Personal Information'),
        ),
        child: SafeArea(
            child: Container(
                margin: EdgeInsets.all(16),
                child: ListView(
                  children: [
                    userInfo('Username', 'John Doe'),
                    userInfo('Email', 'John@gmail.com'),
                    userInfo('Phone number', '0818373939229'),
                    userInfo('Birth date', '12 - 08 - 23'),
                  ],
                ))));
  }
}
