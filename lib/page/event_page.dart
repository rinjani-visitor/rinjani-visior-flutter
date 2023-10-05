import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/event_card.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: CupertinoNavigationBar(
          automaticallyImplyMiddle: true,
          leading: Text(
            "Events",
            style: blackTextStyle.copyWith(fontSize: 34, fontWeight: bold),
          ),
        ),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              EventCard(),
              
              EventCard(),
              
              EventCard(),
              
              EventCard(),
            ],
          ),
        )));
  }
}
