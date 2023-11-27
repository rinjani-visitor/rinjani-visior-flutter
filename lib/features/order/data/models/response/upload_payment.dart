import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';

part 'upload_payment.g.dart';

@JsonSerializable()
class UploadPaymentResponse extends BaseResponse {
  UploadPaymentResponse(
      {required super.errors, required super.message, required super.data});
  factory UploadPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadPaymentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UploadPaymentResponseToJson(this);
}
