import 'package:rinjani_visitor/features/product/domain/entity/addon.dart';
import 'package:rinjani_visitor/features/product/domain/category_enum.dart';

/// for `rangePricing`, remember to make something like this:
/// '80$- 90$ / person'
class ProductEntity {
  ProductEntity(
      {required this.packageId,
      required this.title,
      required this.location,
      required this.imgUrl,
      required this.category,
      required this.priceLow,
      required this.priceHigh,
      required this.rating,
      required this.tripDuration,
      required this.description,
      required this.accomodation,
      required this.reviewCount,
      required this.initenaryList,
      required this.timeList24H,
      required this.addOn,
        this.locationUrl, this.avaiabilityStatus,
      });

  get rangePricing => '$priceLow\$ - $priceHigh\$ / person';

  final String packageId;
  final String title;
  final String location;
  final String imgUrl;
  final ProductCategory category;
  final String? locationUrl;
  final String? avaiabilityStatus;
  final int priceLow;
  final int priceHigh;
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
