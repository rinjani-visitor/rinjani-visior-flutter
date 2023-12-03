import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/presentation/widget/event_card.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        child: SafeArea(
          child: CustomScrollView(
            primary: false,
            scrollBehavior: const CupertinoScrollBehavior(),
            slivers: [
              const CupertinoSliverNavigationBar(
                largeTitle: Text("Events"),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    EventCard(
                      title: "Lombok Festival",
                      date: DateTime.now(),
                      onTap: () {
                        Navigator.pushNamed(context, '/event/detail');
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
