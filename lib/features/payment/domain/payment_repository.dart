import 'package:rinjani_visitor/features/payment/domain/payment_model.dart';

abstract class PaymentRepository {
  Future<List<PaymentModel>> getPaymentMethods();
  Future<List<PaymentModel>> pay(PaymentModel model, String amount);
}
