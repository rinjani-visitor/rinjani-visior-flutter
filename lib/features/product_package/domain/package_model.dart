import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_model.g.dart';
part 'package_model.freezed.dart';

@freezed
class PackageModel with _$PackageModel {
  const factory PackageModel(
      {required String title,
      required String imgUrl,
      required String location,
      required String? locationUrl,
      required String lowestPricing,
      required String highestPricing,
      required String description,
      required String tripDuration,
      required String? avaiabilityStatus,
      required String rating,
      required int reviewCount}) = _PackageModel;

  factory PackageModel.fromJson(Map<String, Object?> json) =>
      _$PackageModelFromJson(json);
}
