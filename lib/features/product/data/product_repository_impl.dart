import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/product/domain/product_model.dart';
import 'package:rinjani_visitor/features/product/domain/product_repository.dart';

class ProductRepositoryImpl implements ProductRespository {
  @override
  Future<LocalState<ProductModel>> bookingPackage(
      {required String packageId,
      List<String>? addOns,
      String? paymentMethod}) {
    // TODO: implement bookingPackage
    throw UnimplementedError();
  }

  @override
  Future<void> cancelPackage({required String packageId}) {
    // TODO: implement cancelPackage
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> getPackageDetail({required String packageId}) {
    // TODO: implement getPackageDetail
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getPackages(
      {int pages = 1,
      int? itemsPerPage = 10,
      String? category,
      String? avaiability}) async {
    final dataMock = [
      const ProductModel(
          packageId: "packageId",
          title: "title",
          location: "location",
          locationUrl: "locationUrl",
          imgUrl: "imgUrl",
          rangePricing: "rangePricing",
          rating: "rating",
          tripDuration: "tripDuration",
          description: "description",
          accomodation: "accomodation",
          addOnIds: ["addonId"],
          reviewIds: ["reviewIds"],
          avaiabilityStatus: "avaiabilityStatus",
          reviewCount: 5)
    ];
    //TODO: remove this
    await Future.delayed(Duration(seconds: 2));
    return dataMock;
  }
}

final productRepositoryProvider = Provider((ref) => ProductRepositoryImpl());
