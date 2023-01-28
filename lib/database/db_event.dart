import 'dart:async';

import 'package:isar/isar.dart';
import 'package:record_and_count/models/event.dart';

import 'DB.dart';

class DBEvent {
  Future<void> insertEvent(Event event) async {
    final isar = await DB().openDB();

    await isar.writeTxn((isar) async {
      await isar.events.put(event);
    });
  }

  Future<List<Event>> getEvents() async {
    final isar = await DB().openDB();

    // "Isar does not store timezone information of your dates.
    // Instead, it converts DateTimes to UTC before storing them.
    // Isar returns all dates in local time." -- Isar docs (https://isar.dev/schema.html#nullable-types)
    // Therefore, we need to convert local time to UTC again.
    var events = await isar.events.where().findAll();

    for (var event in events) {
      event.dateTime = event.dateTime.toUtc();
    }

    return events;
  }

  Future<void> deleteEvent(int id) async {
    final isar = await DB().openDB();

    await isar.writeTxn((isar) async {
      await isar.events.delete(id);
    });
  }

  Future<void> updateEvent(Event event) async {
    final isar = await DB().openDB();

    await isar.writeTxn((isar) async {
      await isar.events.put(event);
    });
  }
}
