import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/search/presentation/view_model/search_suggestion.dart';

class AutoSearch extends ConsumerWidget {
  final void Function(String searchText)? onSearch;
  const AutoSearch({super.key, this.onSearch});

  @override
  Widget build(BuildContext context, ref) {
    final suggestionData =
        ref.watch(searchSuggestionViewModel).map((e) => e.name).toList();
    return RawAutocomplete(
      optionsBuilder: (TextEditingValue textEditingValue) {
        ref
            .read(searchSuggestionViewModel.notifier)
            .update(textEditingValue.text);
        return suggestionData;
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
        return SizedBox(
            height: 200,
            child: SingleChildScrollView(
                child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: options.map((opt) {
                return GestureDetector(
                    onTap: () {
                      onSelected(opt);
                    },
                    child: CupertinoListTile(
                      backgroundColor: CupertinoColors.white,
                      title: Text(opt),
                    ));
              }).toList(),
            )));
      },
    );
  }
}
