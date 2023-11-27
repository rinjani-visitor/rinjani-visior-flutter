import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

class BookingFormEntity {
  ProductDetailEntity? product;
  String userId;
  String productId;
  DateTime startDateTime;
  DateTime? endDateTime;
  List<String> addOns;
  List<String> time = [];
  int get offeringPrice => product!.lowestPrice ?? 0;
  String totalPersons;
  BookingFormEntity({
    required this.userId,
    required this.productId,
    required this.startDateTime,
    this.endDateTime,
    required this.addOns,
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
