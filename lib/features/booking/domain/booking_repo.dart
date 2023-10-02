import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/booking/domain/booking_model.dart';

abstract class BookingRepository {
  Future<LocalState<String>> puchasePackages(BookingModel bookingModel);
}
