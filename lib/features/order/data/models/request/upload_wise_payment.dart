import 'package:json_annotation/json_annotation.dart';

part 'upload_wise_payment.g.dart';

@JsonSerializable()
class UploadWisePayment {
  final String bookingId;
  final String wiseEmail;
  final String wiseAccountName;
  final String imageProofTransfer;

  UploadWisePayment(
      {required this.bookingId,
      required this.wiseEmail,
      required this.wiseAccountName,
      required this.imageProofTransfer});
  factory UploadWisePayment.fromJson(Map<String, dynamic> json) =>
      _$UploadWisePaymentFromJson(json);
  Map<String, dynamic> toJson() => _$UploadWisePaymentToJson(this);
}
