import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/search/data/remote/mock.dart';
import 'package:rinjani_visitor/features/search/domain/entity/search.dart';
import 'package:rinjani_visitor/features/search/domain/repo/search_repo.dart';

final searchRepositoryProvider =
    Provider((ref) => SearchRepositoryImpl(remoteSource: MockRemoteSource()));

class SearchRepositoryImpl implements SearchRepository {
  final MockRemoteSource remoteSource;

  SearchRepositoryImpl({required this.remoteSource});
  @override
  Future<List<SearchEntity>> refresh(String val) async {
    final data = await remoteSource.refresh(val);
    final srings = data.map((e) => e.title).toList();
    return List.generate(
        srings.length, (index) => SearchEntity(name: srings[index]));
  }
}
