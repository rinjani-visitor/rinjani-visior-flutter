import 'package:rinjani_visitor/features/product/domain/category_enum.dart';

class ProductEntity {
  final String productId;
  final String title;
  final bool avaiable;
  final double rating;
  final String category;
  final String location;
  final String thumbnail;
  final int lowestPrice;

  ProductEntity(
      {required this.productId,
      required this.title,
      required this.category,
      required this.avaiable,
      required this.rating,
      required this.location,
      required this.thumbnail,
      required this.lowestPrice});
}

/// for `rangePricing`, remember to make something like this:
/// '80$- 90$ / person'
class ProductDetailEntity {
  ProductDetailEntity(
      {required this.id,
      required this.title,
      required this.status,
      required this.rating,
      required this.location,
      required this.priceLow,
      required this.imgs,
      required this.description,
      required this.tripDuration,
      required this.program,
      required this.images,
      required this.category,
      required this.locationUrl,
      required this.accomodation,
      required this.reviewCount,
      required this.initenaryList,
      required this.timeList24H,
      required this.addOn});

  get rangePricing => '$priceLow\$ / person';
  get avaiabilityStatus => status ? "Avaiable" : "Not Avaiable";

  final String id;
  final String title;
  final bool status;
  final String rating;
  final String location;
  final int priceLow;
  final String imgs;
  final String description;
  final String tripDuration;
  final String program;
  final List<String> images;
  final ProductCategory category;
  final String? locationUrl;
  final String accomodation;
  final int reviewCount;
  final List<String> initenaryList;
  final List<String> timeList24H;
  final List<String> addOn;
  List<String>? reviewIds;
}
