import 'package:flutter/cupertino.dart';
import 'package:record_and_count/database/db_event.dart';
import 'package:record_and_count/models/event.dart';
import 'package:uuid/uuid.dart';

class EventProvider extends ChangeNotifier {
  List<Event> events = [];

  DateTime dateTime = DateTime.now();

  Future<void> addEvent(String emoji, String content) async {
    Event event = Event(id: const Uuid().v1(), emoji: emoji, content: content, dateTime: dateTime);

    await DBEvent().insertEvent(event);

    await getEvents();
  }

  void changeDateTime(DateTime dt) {
    dateTime = dt;

    notifyListeners();
  }

  Future<void> getEvents() async {
    events = await DBEvent().getEvents();

    notifyListeners();
  }

  Future<void> deleteEvent(String id) async {
    await DBEvent().deleteEvent(id);

    events.removeWhere((event) => event.id == id);

    await getEvents();
  }

  Future<void> updateEvent(Event event, String emoji, String content) async {
    Event newEvent = Event(id: event.id, emoji: emoji, content: content, dateTime: event.dateTime);

    await DBEvent().updateEvent(newEvent);

    await getEvents();
  }
}