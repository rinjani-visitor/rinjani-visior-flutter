import 'package:json_annotation/json_annotation.dart';

part 'upload_bank_payment.g.dart';

@JsonSerializable()
class UploadBankPayment {
  final String bookingId;
  final String bankName;
  final String bankAccountName;
  final String imageProofTransfer;

  UploadBankPayment(
      {required this.bookingId,
      required this.bankName,
      required this.bankAccountName,
      required this.imageProofTransfer});
  factory UploadBankPayment.fromJson(Map<String, dynamic> json) =>
      _$UploadBankPaymentFromJson(json);
  Map<String, dynamic> toJson() => _$UploadBankPaymentToJson(this);
}
