import 'package:rinjani_visitor/features/search/domain/entity/search.dart';

/// searchrepository abstract class with refresh method that return list of SearchEntity
abstract class SearchRepository {
  Future<List<SearchEntity>> refresh(String val);
}
