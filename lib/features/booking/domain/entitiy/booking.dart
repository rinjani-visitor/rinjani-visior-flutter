import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

class BookingEntity {
  ProductDetailEntity? product;
  String userId;
  String productId;
  String startDateTime;
  String endDateTime;
  List<String> addOns;
  List<String> time = [];
  int offeringPrice;
  String totalPersons;
  BookingEntity({
    required this.userId,
    required this.productId,
    required this.startDateTime,
    required this.endDateTime,
    required this.addOns,
    required this.offeringPrice,
    required this.totalPersons,
  });
  addOnToString() {
    String addOnString = "";
    for (var element in addOns) {
      addOnString += "$element,";
    }
    return addOnString.substring(0, addOnString.length - 1);
  }
}
