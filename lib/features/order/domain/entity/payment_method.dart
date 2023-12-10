import 'dart:io';

import 'package:rinjani_visitor/features/order/data/source/remote.dart';

/// payment method contract, this should be used as primary extends basis
/// due to extensive
abstract class PaymentMethod {
  final String bookingId;

  PaymentMethod(this.bookingId);

  void fillData({String? field1, String? field2, File? file});
  Future<String> submit(RemoteOrderSource remote, String token);
}


