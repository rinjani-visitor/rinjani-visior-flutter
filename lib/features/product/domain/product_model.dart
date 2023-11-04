import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rinjani_visitor/features/product/domain/addon_model.dart';

part 'product_model.g.dart';
part 'product_model.freezed.dart';

/// for `rangePricing`, remember to make something like this:
/// '80$- 90$ / person'
@freezed
class ProductModel with _$ProductModel {
  get rangePricing => '$priceLow\$ - $priceHigh\$ / person';
  const ProductModel._();
  const factory ProductModel({
    required String packageId,
    required String title,
    required String location,
    required String imgUrl,
    String? locationUrl,
    String? avaiabilityStatus,

    /// example: 80$- 90$ / person
    required int priceLow,
    required int priceHigh,
    required String rating,
    required String tripDuration,
    required String description,
    required String accomodation,
    required int reviewCount,
    required List<String> initenaryList,
    required List<String> timeList24H,
    required List<AddOnModel> addOn,
    List<String>? reviewIds,
  }) = _PackageModel;

  factory ProductModel.fromJson(Map<String, Object?> json) =>
      _$ProductModelFromJson(json);
}
