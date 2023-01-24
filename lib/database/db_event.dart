import 'dart:async';

import 'package:intl/intl.dart';
import 'package:record_and_count/models/event.dart';
import 'package:sqflite/sqflite.dart';
import 'package:record_and_count/database/db.dart';

class DBEvent {
  Future<void> insertEvent(Event event) async {
    final db = await DB().database();

    await db.insert(
      'events',
      event.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Event>> getEvents() async {
    final db = await DB().database();

    final List<Map<String, dynamic>> maps = await db.query('events');

    return List.generate(
      maps.length,
      (index) => Event(
        id: maps[index]['id'],
        emoji: maps[index]['emoji'],
        content: maps[index]['content'],
        dateTime:
            DateFormat('yyyy-MM-dd HH:mm:ss').parse(maps[index]['dateTime']),
      ),
    );
  }

  Future<void> deleteEvent(String id) async {
    final db = await DB().database();

    await db.delete(
      'events',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateEvent(Event event) async {
    final db = await DB().database();

    await db.update(
      'events',
      event.toMap(),
      where: 'id = ?',
      whereArgs: [event.id],
    );
  }
}
