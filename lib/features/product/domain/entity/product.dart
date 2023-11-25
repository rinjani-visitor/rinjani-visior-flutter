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
      this.priceLow,
      this.imgs,
      this.description,
      this.tripDuration,
      this.program,
      this.images,
      this.category,
      this.locationUrl,
      this.accomodation,
      this.reviewCount,
      this.initenaryList,
      this.timeList24H,
      this.addOn});

  get rangePricing => '$priceLow\$ / person';
  get avaiabilityStatus => status != null ? "Avaiable" : "Not Avaiable";

  final String id;
  String? title;
  bool? status;
  String? rating;
  String? location;
  int? priceLow;
  String? imgs;
  String? description;
  String? tripDuration;
  String? program;
  List<String>? images;
  String? category;
  String? locationUrl;
  String? accomodation;
  int? reviewCount;
  List<String>? initenaryList;
  List<String>? timeList24H;
  List<String>? addOn;
  List<String>? reviewIds;
}
