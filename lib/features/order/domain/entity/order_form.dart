import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';
import 'package:rinjani_visitor/features/order/domain/entity/payment_method.dart';

class OrderFormEntity {
  BookingDetailEntity? bookingDetail;
  PaymentMethod? paymentMethod;

  OrderFormEntity({this.paymentMethod, this.bookingDetail});
}
