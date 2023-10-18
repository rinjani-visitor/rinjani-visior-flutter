import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> suggestons = [
  "USA",
  "UK",
  "Uganda",
  "Uruguay",
  "United Arab Emirates"
];

class AutoSearch extends StatelessWidget {
  const AutoSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        } else {
          List<String> matches = <String>[];
          matches.addAll(suggestons);

          matches.retainWhere((s) {
            return s
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase());
          });
          return matches;
        }
      },
      onSelected: (String selection) {
        print('You just selected $selection');
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return CupertinoSearchTextField(
          // decoration: InputDecoration(border: OutlineInputBorder()),
          controller: textEditingController,
          focusNode: focusNode,
          onSubmitted: (String value) {},
        );
      },
      optionsViewBuilder: (BuildContext context,
          void Function(String) onSelected, Iterable<String> options) {
        return Material(
            child: SizedBox(
                height: 200,
                child: SingleChildScrollView(
                    child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: options.map((opt) {
                    return InkWell(
                        onTap: () {
                          onSelected(opt);
                        },
                        child: CupertinoListTile(
                          title: Text(opt),
                        ));
                  }).toList(),
                ))));
      },
    );
  }
}
