import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/event_card.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        child: SafeArea(
          child: CustomScrollView(
            primary: false,
            scrollBehavior: CupertinoScrollBehavior(),
            slivers: [
              const CupertinoSliverNavigationBar(
                largeTitle: Text("Events"),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    EventCard(),
                    EventCard(),
                    EventCard(),
                    EventCard(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
