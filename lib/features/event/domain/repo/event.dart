import 'package:rinjani_visitor/features/product/domain/entity/event.dart';

/// event repository abscract class, provide get events, event detail, and event booking
abstract class EventRepository {
  /// get events from server
  Future<List<EventEntity>> getEvents();

  /// get events information from server by event id
  Future<EventEntity> getEventDetail(String id);
}
