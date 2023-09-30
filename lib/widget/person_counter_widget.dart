import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class PersonCounterWidget extends StatefulWidget {
  const PersonCounterWidget({Key? key}) : super(key: key);

  @override
  _PersonCounterWidgetState createState() => _PersonCounterWidgetState();
}

class _PersonCounterWidgetState extends State<PersonCounterWidget> {
  int person = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 294,
      height: 186,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 16,
          ),
          Text(
            'For how many person?',
            style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 20),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(primaryColor)),
                onPressed: () {
                  setState(() {
                    person -= 1;
                  });
                },
                child: Text(
                  '-',
                  style:
                      whiteTextStyle.copyWith(fontSize: 16, fontWeight: bold),
                ),
              ),
              SizedBox(
                width: 32,
              ),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(smallRadius),
                    border: Border.all(color: lightGray)),
                child: Center(child: Text('$person')),
              ),
              SizedBox(
                width: 32,
              ),
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(primaryColor)),
                onPressed: () {
                  setState(() {
                    person += 1;
                  });
                },
                child: Text(
                  '+',
                  style:
                      whiteTextStyle.copyWith(fontSize: 16, fontWeight: bold),
                ),
              ),
            ],
          ),
          Spacer(),
          TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(primaryColor)),
              onPressed: () {},
              child: Container(
                  width: 294,
                  height: 32,
                  child: Center(
                      child: Text(
                    'Continue',
                    style:
                        whiteTextStyle.copyWith(fontSize: 16, fontWeight: bold),
                  )))),
          Spacer(),
        ],
      )),
    );
  }
}
