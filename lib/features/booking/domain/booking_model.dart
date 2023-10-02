import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rinjani_visitor/features/product_package/domain/package_model.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

@freezed
class BookingModel with _$BookingModel {
  const factory BookingModel(
      {required List<PackageModel> packageList,
      required String date,
      required String time,
      required String pricingOffer,
      required String currencyUnit,
      required String? paymentProvider}) = _BookingModel;

  factory BookingModel.fromJson(Map<String, Object?> json) =>
      _$BookingModelFromJson(json);
}
