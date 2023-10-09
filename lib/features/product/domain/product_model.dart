import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';
part 'product_model.freezed.dart';

/// for `rangePricing`, remember to make something like this:
/// '80$- 90$ / person'
@freezed
class PackageModel with _$PackageModel {
  const factory PackageModel(
      {required String packageId,
      required String title,
      required String location,
      required String? locationUrl,
      required String imgUrl,

      /// example: 80$- 90$ / person
      required String rangePricing,
      required String rating,
      required String tripDuration,
      required String description,
      required String accomodation,
      required List<String>? addOnIds,
      required List<String>? reviewIds,
      required String? avaiabilityStatus,
      required int reviewCount}) = _PackageModel;

  factory PackageModel.fromJson(Map<String, Object?> json) =>
      _$PackageModelFromJson(json);
}
