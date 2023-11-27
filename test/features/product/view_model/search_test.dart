import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';


@GenerateMocks([ProductRepositoryImpl])
void main() {
  group("ProductSearchViewModel", () {
    setUp(() {});
    test("should fetch packages when build", () => null);
    test("should fetch filtered package when method search is invoked",
        () => null);
  });
}
