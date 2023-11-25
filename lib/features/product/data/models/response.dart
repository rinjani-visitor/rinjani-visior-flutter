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
  String productId;
  String? title;
  String? category;
  @JsonKey(name: "status")
  bool? avaiable;
  double? rating;
  String? location;
  String? thumbnail;
  int? lowestPrice;

  ProductResponseBody(
      {required this.productId,
      this.title,
      this.avaiable,
      this.rating,
      this.location,
      this.thumbnail,
      this.category,
      this.lowestPrice});

  factory ProductResponseBody.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseBodyToJson(this);

  ProductEntity toEntity() => ProductEntity(
        productId: productId,
        title: title,
        avaiable: avaiable,
        rating: rating,
        category: category,
        location: location,
        thumbnail: thumbnail,
        lowestPrice: lowestPrice,
      );
}
