import 'package:rinjani_visitor/features/product/domain/category_enum.dart';

class ProductEntity {
  final String productId;
  String? title;
  bool? avaiable;
  double? rating;
  String? category;
  String? location;
  String? thumbnail;
  int? lowestPrice;

  ProductEntity(
      {required this.productId,
      this.title,
      this.category,
      this.avaiable,
      this.rating,
      this.location,
      this.thumbnail,
      this.lowestPrice});
}

/// for `rangePricing`, remember to make something like this:
/// '80$- 90$ / person'
class ProductDetailEntity {
  ProductDetailEntity(
      {required this.id,
      required this.title,
      this.status,
      this.rating,
      this.location,
      this.lowestPrice,
      this.thumbnail,
      this.description,
      this.tripDuration,
      this.program,
      this.images,
      this.category,
      this.locationUrl,
      this.accomodation,
      this.reviewCount,
      this.facilities,
      this.timeList24H,
      this.addOns,
      this.favoritedCount,
      this.reviews,
      this.note,
      this.subCategory});

  get rangePricing => '$lowestPrice\$ / person';
  get avaiabilityStatus => status != null ? "Avaiable" : "Not Avaiable";

  final String id;
  String? title;
  bool? status;
  String? rating;
  String? location;
  int? lowestPrice;
  int? reviewCount;
  String? thumbnail;
  String? description;
  String? note;
  String? tripDuration;
  String? program;
  String? category;
  String? subCategory;
  String? favoritedCount;
  String? locationUrl;
  String? accomodation;
  List<String>? images;
  List<String>? facilities;
  List<String>? timeList24H;
  List<String>? addOns;
  List<String>? reviews;
}
