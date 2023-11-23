import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';

import '../../domain/entity/product.dart';

part 'response.g.dart';

@JsonSerializable()
class ProductResponse extends BaseResponse<List<ProductResponseBody>?> {
  ProductResponse(
      {required super.errors, required super.message, required super.data});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class ProductResponseBody {
  final String productId;
  final String title;
  @JsonKey(name: "status")
  final bool avaiable;
  final double rating;
  final String location;
  final String thumbnail;
  final int lowestPrice;

  ProductResponseBody(
      {required this.productId,
      required this.title,
      required this.avaiable,
      required this.rating,
      required this.location,
      required this.thumbnail,
      required this.lowestPrice});

  factory ProductResponseBody.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseBodyToJson(this);

  ProductEntity toEntity() => ProductEntity(
        productId: productId,
        title: title,
        avaiable: avaiable,
        rating: rating,
        location: location,
        thumbnail: thumbnail,
        lowestPrice: lowestPrice,
      );
}
