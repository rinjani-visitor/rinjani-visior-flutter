import 'package:rinjani_visitor/features/booking/domain/enum/history_status.dart';

const bookingHistoryStatus = [
  'Offering',
  'Waiting for Payment',
  'Declined',
  'Payment Reviewing',
  'Payment Failed',
  'Success',
];

class BookingEntity {
  final String bookingId;
  /// date when booking is recorded, in local time
  final DateTime bookingDate;
  final String title;
  final BookingStatus bookingStatus;
  final String? bookingNote;
  final int? rating;
  final String? location;
  final String? imgUrl;

  BookingEntity({
    required this.bookingId,
    required this.bookingDate,
    required this.title,
    required this.bookingStatus,
    this.bookingNote,
    this.rating,
    this.location,
    this.imgUrl,
  });
}

// write variable in entity class following this field:
//"productId": "043e60d5-7afc-4074-b627-aff30a83ab0a",
// "userId": "b08fd6e8-27b6-44a3-af79-c2bbaff68443",
// "bookingId": "b2df1c39-3d30-49ba-85c8-a4591a92dca4",
// "startDateTime": "2026-09-04 00:00:00",
// "offeringPrice": 234,
// "addOns": "extra guide",
// "totalPersons": 3,
// "createdAt": "2023-11-27 12:30:44",
// "updatedAt": "2023-11-27 14:59:46",
// "bookingStatus": "Success",
// "adminMessage": "approve",
// "note": "Your payment has been recieved and we will contact you to start the journey. Thank you.",
// "title": "Sharing Summit Program Rinjani Mountain Package",
// "rating": 0,
// "location": "Senaru Village, North Lombok",
// "thumbnail": "https://test.rinjanivisitor.com/images/thumbnail/1700851159451-692213673.jpg"

class BookingDetailEntity {
  final String productId;
  final String userId;
  final String bookingId;
  final DateTime? startDateTime;
  final int? offeringPrice;
  final String? addOns;
  final int? totalPersons;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final BookingStatus? bookingStatus;
  final String? adminMessage;
  final String? note;
  final String? title;
  final int? rating;
  final String? location;
  final String? thumbnail;

  BookingDetailEntity(
      {required this.productId,
      required this.userId,
      required this.bookingId,
      this.startDateTime,
      this.offeringPrice,
      this.addOns,
      this.totalPersons,
      this.createdAt,
      this.updatedAt,
      this.bookingStatus,
      this.adminMessage,
      this.note,
      this.title,
      this.rating,
      this.location,
      this.thumbnail});
}
