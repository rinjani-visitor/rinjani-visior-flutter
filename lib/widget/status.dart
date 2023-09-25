import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class Status extends StatelessWidget {
const Status({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(smallRadius), color: infoBlue),
        child: Text(
          'Available',
          style: whiteTextStyle.copyWith(fontSize: 10, fontWeight: regular),
        ),
      );
  }
}