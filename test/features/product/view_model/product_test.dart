import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rinjani_visitor/core/constant/product_package.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/category_enum.dart';
import 'package:rinjani_visitor/features/product/presentation/view_model/product.dart';

import 'product_test.mocks.dart';

@GenerateMocks([ProductRepositoryImpl])
void main() {
  group('ProductViewModel, CategoryViewModel, SearchViewModel', () {
    late MockProductRepositoryImpl productRepository;
    late ProviderContainer container;
    setUp(() {
      productRepository = MockProductRepositoryImpl();
      container = ProviderContainer(overrides: [
        productRepositoryProvider.overrideWithValue(productRepository),
      ]);
      addTearDown(() => container.dispose());
    });

    test('should fetch packages on build', () async {
      final expectedData = mockPackages;
      when(productRepository.getPackages()).thenAnswer(
          (_) => Future.value(expectedData.getRange(0, 10).toList()));
      await expectLater(container.read(productViewModelProvider.future),
          completion(isNotNull));

      verify(productRepository.getPackages()).called(1);
    });

    test('should fetch package with matches category', () async {
      final expectedData = mockPackages
          .where((element) => element.category == ProductCategory.culture)
          .toList();
      when(productRepository.getPackages(
              category: ProductCategory.culture.name))
          .thenAnswer(
              (_) => Future.value(expectedData.getRange(0, 10).toList()));
      final result = await container
          .read(productViewModelProvider.notifier)
          .getProductByCategory(ProductCategory.culture);
      expect(result, isNotNull);
      expect(result, isNotEmpty);
      verify(productRepository.getPackages(
              category: ProductCategory.culture.name))
          .called(1);
    });
  });
}
