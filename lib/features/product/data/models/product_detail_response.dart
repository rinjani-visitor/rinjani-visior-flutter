import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

part 'product_detail_response.g.dart';

@JsonSerializable()
class ProductDetailResponse extends BaseResponse<ProductDetailBody> {
  ProductDetailResponse(
      {required super.errors, required super.message, required super.data});

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailResponseToJson(this);

  ProductDetailEntity toEntity() => ProductDetailEntity(
      id: data.productId,
      category: data.category,
      accomodation: null,
      title: data.title,
      status: data.status,
      description: data.description,
      imgs: data.thumbnail,
      images: data.fotos?.map((e) => e.url!).toList(),
      location: data.location,
      priceLow: data.lowestPrice,
      rating: data.rating.toString(),
      tripDuration: data.duration,
      program: data.program,
      reviewCount: data.favoritedCount,
      initenaryList: [],
      addOn: [],
      locationUrl: '',
      timeList24H: []);
}

@JsonSerializable()
class ProductDetailBody {
  final String productId;
  String? title;
  bool? status;
  double? rating;
  String? location;
  int? lowestPrice;
  String? thumbnail;
  String? description;
  String? duration;
  String? program;
  String? porter;
  String? guide;
  String? category;
  String? subCategory;
  int? favoritedCount;
  List<String>? facilities;
  String? note;
  String? createdAt;
  String? updatedAt;
  List<Fotos>? fotos;
  List<String>? reviews;

  ProductDetailBody(
      {required this.productId,
      this.title,
      this.status,
      this.rating,
      this.location,
      this.lowestPrice,
      this.thumbnail,
      this.description,
      this.duration,
      this.program,
      this.porter,
      this.guide,
      this.category,
      this.subCategory,
      this.favoritedCount,
      this.facilities,
      this.note,
      this.createdAt,
      this.updatedAt,
      this.fotos,
      this.reviews});

  factory ProductDetailBody.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailBodyFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailBodyToJson(this);
}

@JsonSerializable()
class Fotos {
  int? fotoId;
  String? url;
  String? originalName;
  String? productId;

  Fotos({this.fotoId, this.url, this.originalName, this.productId});

  factory Fotos.fromJson(Map<String, dynamic> json) => _$FotosFromJson(json);
  Map<String, dynamic> toJson() => _$FotosToJson(this);
}
