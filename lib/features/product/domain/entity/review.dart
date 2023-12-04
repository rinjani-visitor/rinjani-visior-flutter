import 'package:rinjani_visitor/core/presentation/utils/internationalization.dart';

class ReviewEntity {
  final String id;
  final String name;
  final String content;
  final DateTime dateTime;

  ReviewEntity({
    required this.id,
    required this.name,
    required this.content,
    required this.dateTime,
  });

  String get localizedDateTime => dateFormat.format(dateTime);
}
