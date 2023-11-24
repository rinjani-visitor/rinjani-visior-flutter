import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';
import 'package:rinjani_visitor/features/product/domain/category_enum.dart';
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
      category: ProductCategory.rinjani,
      accomodation: "",
      id: data.productId,
      title: data.title,
      status: data.status,
      description: data.description,
      imgs: data.thumbnail,
      images: data.fotos!.map((e) => e.url!).toList(),
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
  final String title;
  final bool status;
  final double rating;
  final String location;
  final int lowestPrice;
  final String thumbnail;
  final String description;
  final String duration;
  final String program;
  final String porter;
  final String guide;
  final String category;
  final String subCategory;
  final int favoritedCount;
  List<String>? facilities;
  String? note;
  String? createdAt;
  String? updatedAt;
  List<Fotos>? fotos;
  List<String>? reviews;

  ProductDetailBody(
      {required this.productId,
      required this.title,
      required this.status,
      required this.rating,
      required this.location,
      required this.lowestPrice,
      required this.thumbnail,
      required this.description,
      required this.duration,
      required this.program,
      required this.porter,
      required this.guide,
      required this.category,
      required this.subCategory,
      required this.favoritedCount,
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
