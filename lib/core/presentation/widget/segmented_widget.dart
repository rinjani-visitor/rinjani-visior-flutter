import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/presentation/widget/time_button.dart';

class KVContentWidget extends StatelessWidget {
  final String title;
  final Widget content;
  const KVContentWidget(
      {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: blackTextStyle.copyWith(
              fontSize: textButton1, fontWeight: semibold),
        ),
        content
      ],
    );
  }
}

class KVDetailDescriptionWidget extends StatelessWidget {
  final List<KVContentWidget> kvChildren;
  const KVDetailDescriptionWidget({super.key, required this.kvChildren});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          kvChildren.length,
          (index) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: kvChildren[index],
              )),
    );
  }
}

class TimeList extends StatelessWidget {
  const TimeList({
    super.key,
    required this.timeListData,
    required this.selectedTimeListData,
    required this.onTimeListTap,
  });

  final List<String> timeListData;
  final List<String> selectedTimeListData;
  final void Function(String value, bool isSelected) onTimeListTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: timeListData.isEmpty
          ? const Text("time selection is not avaiable for this package")
          : Row(
              children: List.generate(timeListData.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: TimeButtonWidget(
                    time: timeListData[index],
                    selected:
                        selectedTimeListData.contains(timeListData[index]),
                    onToggle: (value, isSelected) {
                      onTimeListTap(value, isSelected);
                    },
                  ),
                );
              }),
            ),
    );
  }
}

// ===== // parent // ===== //

class DetailSegmentedWidget extends StatefulWidget {
  final Widget description;
  final Widget initenary;

  const DetailSegmentedWidget(
      {super.key, required this.description, required this.initenary});

  @override
  State<DetailSegmentedWidget> createState() => _DetailSegmentedWidgetState();
}

class _DetailSegmentedWidgetState extends State<DetailSegmentedWidget> {
  Map<dynamic, Widget> children = <dynamic, Widget>{
    0: const Text('Description'),
    1: const Text('Features')
  };
  int _sliding = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          child: CupertinoSlidingSegmentedControl(
              groupValue: _sliding,
              children: children,
              onValueChanged: (value) {
                setState(() {
                  _sliding = value;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: _sliding == 0 ? widget.description : widget.initenary,
        )
      ],
    );
  }
}

class DetailIniteraryWidget extends StatelessWidget {
  final List<String> initenaryList;

  const DetailIniteraryWidget({super.key, required this.initenaryList});

  String initenaryDatas() {
    var string = "";
    for (final item in initenaryList) {
      string = string += "- $item\n";
    }
    return string;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Features from this package',
          style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
        ),
        const SizedBox(
          height: 8,
        ),
        MarkdownBody(
          data: initenaryDatas(),
          styleSheetTheme: MarkdownStyleSheetBaseTheme.cupertino,
        )
      ],
    );
  }
}
