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

class BookingDetailEntity {
  final String name;
  final String? country;
  final String email;
  final String? phoneNumber;
  final String bookingId;
  final DateTime startDateTime;
  final DateTime? endDateTime;
  final String offeringPrice;
  final String addOns;
  final String totalPersons;
  final DateTime createdAt;
  final DateTime updatedAt;
  final BookingStatus bookingStatus;
  final String note;

  BookingDetailEntity({
    required this.name,
    this.country,
    required this.email,
    this.phoneNumber,
    required this.bookingId,
    required this.startDateTime,
    this.endDateTime,
    required this.offeringPrice,
    required this.addOns,
    required this.totalPersons,
    required this.createdAt,
    required this.updatedAt,
    required this.bookingStatus,
    required this.note,
  });
}
