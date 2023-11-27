import 'package:rinjani_visitor/core/presentation/utils/internationalization.dart';

class ReviewEntity {
  final String id;
  final String username;
  final String review;
  final DateTime dateTime;

  ReviewEntity({
    required this.id,
    required this.username,
    required this.review,
    required this.dateTime,
  });

  String get localizedDateTime => dateFormat.format(dateTime);
}
