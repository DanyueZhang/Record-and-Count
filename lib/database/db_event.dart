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

    return await isar.events.where().findAll();
  }

  Future<void> deleteEvent(int id) async {
    final isar = await DB().openDB();

    await isar.writeTxn((isar) async {
      final success = await isar.events.delete(id);
    });
  }

  Future<void> updateEvent(Event event) async {
    final isar = await DB().openDB();

    await isar.writeTxn((isar) async {
      await isar.events.put(event);
    });
  }
}
