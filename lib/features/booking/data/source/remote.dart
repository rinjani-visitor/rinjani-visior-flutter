import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rinjani_visitor/core/constant/network.dart';
import 'package:rinjani_visitor/features/booking/data/models/response/response.dart';
import '../models/request/post_booking.dart';

part 'remote.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class RemoteBookingDataSource {
  factory RemoteBookingDataSource(Dio dio, {String? baseUrl}) =
      _RemoteBookingDataSource;

  @POST("/api/booking")
  Future<CreateBookingResponse> createBooking(
      @Header("Authorization") String token,
      @Body() PostBookingRequest booking);
  @GET("/api/booking")
  Future<GetBookingResponse> getBookings(
    @Header("Authorization") String token,
  );
  @GET("/api/booking/{id}")
  Future<GetBookingDetailResponse> getBookingDetail(
    @Header("Authorization") String token,
    @Path("id") String bookingId,
  );
  @PATCH("/api/booking")
  Future<UpdateBookingResponse> updateBooking(PostBookingRequest booking);

  @DELETE("/api/booking/{id}")
  Future<void> deleteBooking(
    @Header("Authorization") String token,
    @Path("id") String bookingId,
  );
}
