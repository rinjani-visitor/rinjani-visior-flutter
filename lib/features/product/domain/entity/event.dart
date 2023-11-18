class EventEntity {
  const EventEntity(
      {required this.title,
      required this.imgUrl,
      required this.dateTime,
      required this.description});

  final String title;
  final String imgUrl;
  final String dateTime;
  final String? description;
}
