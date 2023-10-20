import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/page/booking_detail_page.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class PersonCounterWidget extends StatefulWidget {
  final void Function(int value) onSubmit;
  const PersonCounterWidget({Key? key, required this.onSubmit})
      : super(key: key);

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
          const SizedBox(
            height: 16,
          ),
          Text(
            'For how many person?',
            style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 20),
          ),
          const Spacer(),
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
              const SizedBox(
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
              const SizedBox(
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
          const Spacer(),
          TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(primaryColor)),
              onPressed: () {
                Navigator.pop(context);
                widget.onSubmit(person);
              },
              child: Container(
                  width: 294,
                  child: Center(
                      child: Text(
                    'Continue',
                    style:
                        whiteTextStyle.copyWith(fontSize: 16, fontWeight: bold),
                  )))),
          const Spacer(),
        ],
      )),
    );
  }
}
