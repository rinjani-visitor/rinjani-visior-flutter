import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class LoginGoogle extends StatelessWidget {
  const LoginGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 48),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(smallRadius),
            color: mediumGray,
            border: Border.all(color: lightGray, width: 1)),
        child: TextButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/Google.png'))),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'Login with Google',
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: semibold),
              )
            ],
          ),
        ));
  }
}
