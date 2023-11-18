import 'package:rinjani_visitor/features/payment/domain/entity/payment.dart';

abstract class PaymentRepository {
  Future<List<PaymentModel>> getPaymentMethods();
  Future<List<PaymentModel>> pay(PaymentModel model, String amount);
}
