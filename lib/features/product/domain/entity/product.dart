import 'package:rinjani_visitor/features/product/domain/entity/addon.dart';
import 'package:rinjani_visitor/features/product/domain/category_enum.dart';

class ProductEntity {
  final String productId;
  final String title;
  final bool avaiable;
  final double rating;
  final String location;
  final String thumbnail;
  final int lowestPrice;

  ProductEntity(
      {required this.productId,
      required this.title,
      required this.avaiable,
      required this.rating,
      required this.location,
      required this.thumbnail,
      required this.lowestPrice});
}

/// for `rangePricing`, remember to make something like this:
/// '80$- 90$ / person'
class ProductDetailEntity {
  ProductDetailEntity({
    required this.id,
    required this.title,
    required this.location,
    required this.imgs,
    required this.images,
    required this.category,
    required this.priceLow,
    required this.rating,
    required this.tripDuration,
    required this.description,
    required this.accomodation,
    required this.reviewCount,
    required this.initenaryList,
    required this.timeList24H,
    required this.addOn,
    this.locationUrl,
    this.avaiabilityStatus,
  });

  get rangePricing => '$priceLow\$ / person';

  final String id;
  final String title;
  final String location;
  final String imgs;
  final List<String> images;
  final ProductCategory category;
  final String? locationUrl;
  final String? avaiabilityStatus;
  final int priceLow;
  final String rating;
  final String tripDuration;
  final String description;
  final String accomodation;
  final int reviewCount;
  final List<String> initenaryList;
  final List<String> timeList24H;
  final List<AddOnEntity> addOn;
  List<String>? reviewIds;
}
