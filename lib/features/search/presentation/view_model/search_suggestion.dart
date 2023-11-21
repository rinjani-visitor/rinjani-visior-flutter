import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/search/data/search_repo_impl.dart';
import 'package:rinjani_visitor/features/search/domain/entity/search.dart';

final searchSuggestionViewModel =
    StateNotifierProvider<SearchSuggestionViewModel, List<SearchEntity>>(
        (ref) => SearchSuggestionViewModel(ref.read(searchRepositoryProvider)));

class SearchSuggestionViewModel extends StateNotifier<List<SearchEntity>> {
  final SearchRepositoryImpl searchRepositoryImpl;
  SearchSuggestionViewModel(this.searchRepositoryImpl) : super([]);
  void update(String val) async {
    final result = await searchRepositoryImpl.refresh(val);
    state = result;
  }
}
