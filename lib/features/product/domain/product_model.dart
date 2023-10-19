import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';
part 'product_model.freezed.dart';

/// for `rangePricing`, remember to make something like this:
/// '80$- 90$ / person'
@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String packageId,
    required String title,
    required String location,
    required String imgUrl,
    String? locationUrl,
    String? avaiabilityStatus,

    /// example: 80$- 90$ / person
    required String rangePricing,
    required String rating,
    required String tripDuration,
    required String description,
    required String accomodation,
    required int reviewCount,
    required List<String> initenaryList,
    required List<String> timeList24H,
    List<String>? addOnIds,
    List<String>? reviewIds,
  }) = _PackageModel;

  factory ProductModel.fromJson(Map<String, Object?> json) =>
      _$ProductModelFromJson(json);
}
