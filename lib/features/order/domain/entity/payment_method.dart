import 'dart:io';

abstract class PaymentMethod {
  void fillData({String? field1, String? field2, File? file});
}


