import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rinjani_visitor/core/constant/network.dart';

import '../models/response/create_booking.dart';
import '../models/request/post_booking.dart';

part 'remote.g.dart';

@RestApi(baseUrl: restApiBaseUrl)
abstract class BookingRemoteDataSource {
  factory BookingRemoteDataSource(Dio dio, {String? baseUrl}) =
      _BookingRemoteDataSource;
  // Future<Booking> getBooking(String id);
  // Future<List<Booking>> getBookings();
  @POST("/api/booking")
  Future<CreateBookingResponse> createBooking(
      @Body() PostBookingRequest booking);
  // Future<Booking> updateBooking(Booking booking);
}
