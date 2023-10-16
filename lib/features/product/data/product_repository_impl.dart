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
          packageId: "thisispackageid",
          title: "Rinjani Trip",
          location: "Lombok Utara, Indonesia",
          locationUrl: "",
          imgUrl: "",
          rangePricing: "10\$ - 20\$/person",
          rating: "4.9",
          tripDuration: "2 days, 1 night",
          description: "Basic package",
          accomodation: "accomodation",
          addOnIds: [""],
          reviewIds: [""],
          avaiabilityStatus: "avaiable",
          initenaryList: [""],
          reviewCount: 32,
          timeList24H: ["08.00", "12.00"])
    ];
    //TODO: remove this
    await Future.delayed(Duration(seconds: 2));
    return dataMock;
  }
}

final productRepositoryProvider = Provider((ref) => ProductRepositoryImpl());
