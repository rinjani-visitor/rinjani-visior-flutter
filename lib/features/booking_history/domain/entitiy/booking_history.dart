class BookingHistoryEntity {
  final String id;
  final String title;
  final DateTime dateTime;
  final String status;
  BookingHistoryEntity(
      {required this.id,
      required this.title,
      required this.dateTime,
      required this.status});
}
