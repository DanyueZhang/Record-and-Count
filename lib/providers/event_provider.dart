import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:record_and_count/database/db_event.dart';
import 'package:record_and_count/models/event.dart';

class EventProvider extends ChangeNotifier {
  List<Event> events = [];

  DateTime dateTime = DateTime.now();

  Future<void> addEvent(String emoji, String content) async {
    Event event = Event(emoji: emoji, content: content, dateTime: dateTime);

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

  Future<void> deleteEvent(int id) async {
    await DBEvent().deleteEvent(id);

    await getEvents();
  }

  Future<void> updateEvent(Event event, String emoji, String content) async {
    event
      ..emoji = emoji
      ..content = content;

    await DBEvent().updateEvent(event);

    await getEvents();
  }
}
