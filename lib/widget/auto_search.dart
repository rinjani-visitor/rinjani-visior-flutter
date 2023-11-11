import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/constant/product_package.dart';

List<String> suggestons = [
  "USA",
  "UK",
  "Uganda",
  "Uruguay",
  "United Arab Emirates"
];

class AutoSearch extends StatelessWidget {
  final void Function(String searchText)? onSearch;
  const AutoSearch({super.key, this.onSearch});

  @override
  Widget build(BuildContext context) {
    final suggestionData = mockPackages.map((e) => e.title).toList();
    return RawAutocomplete(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        } else {
          List<String> matches = <String>[];
          matches.addAll(suggestionData);

          matches.retainWhere((s) {
            return s
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase());
          });
          return matches;
        }
      },
      onSelected: (String selection) {
        debugPrint('You just selected $selection');
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return CupertinoSearchTextField(
          // decoration: InputDecoration(border: OutlineInputBorder()),
          controller: textEditingController,
          focusNode: focusNode,
          onSubmitted: onSearch,
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
