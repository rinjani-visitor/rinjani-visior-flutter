// Mocks generated by Mockito 5.4.3 from annotations
// in rinjani_visitor/test/features/product/view_model/search_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart'
    as _i3;
import 'package:rinjani_visitor/features/product/data/source/remote.dart'
    as _i2;
import 'package:rinjani_visitor/features/product/domain/entity/product.dart'
    as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeProductRemoteSource_0 extends _i1.SmartFake
    implements _i2.ProductRemoteSource {
  _FakeProductRemoteSource_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProductRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRepositoryImpl extends _i1.Mock
    implements _i3.ProductRepositoryImpl {
  MockProductRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ProductRemoteSource get remote => (super.noSuchMethod(
        Invocation.getter(#remote),
        returnValue: _FakeProductRemoteSource_0(
          this,
          Invocation.getter(#remote),
        ),
      ) as _i2.ProductRemoteSource);

  @override
  _i4.Future<List<_i5.ProductEntity>> getProducts(
    String? token, {
    String? category,
    bool? avaiable,
    int? rating,
    String? query,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [token],
          {
            #category: category,
            #avaiable: avaiable,
            #rating: rating,
            #query: query,
          },
        ),
        returnValue:
            _i4.Future<List<_i5.ProductEntity>>.value(<_i5.ProductEntity>[]),
      ) as _i4.Future<List<_i5.ProductEntity>>);

  @override
  _i4.Future<_i5.ProductDetailEntity?> getProductDetail(
    String? token, {
    required String? productId,
    required String? category,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProductDetail,
          [token],
          {
            #productId: productId,
            #category: category,
          },
        ),
        returnValue: _i4.Future<_i5.ProductDetailEntity?>.value(),
      ) as _i4.Future<_i5.ProductDetailEntity?>);

  @override
  _i4.Future<bool?> toggleFavorite(
    String? token,
    String? productId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #toggleFavorite,
          [
            token,
            productId,
          ],
        ),
        returnValue: _i4.Future<bool?>.value(),
      ) as _i4.Future<bool?>);

  @override
  _i4.Future<List<_i5.ProductEntity>> getFavorites(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFavorites,
          [token],
        ),
        returnValue:
            _i4.Future<List<_i5.ProductEntity>>.value(<_i5.ProductEntity>[]),
      ) as _i4.Future<List<_i5.ProductEntity>>);
}
