import 'package:record_and_count/models/Counter.dart';
import 'package:sqflite/sqflite.dart';
import 'package:record_and_count/database/db.dart';

class DBCounter {
  Future<void> insertCounter(Counter counter) async {
    final db = await DB().database();

    await db.insert(
      'counters',
      counter.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Counter>> getCounters() async {
    final db = await DB().database();

    final List<Map<String, dynamic>> maps = await db.query('counters');

    return List.generate(
      maps.length,
      (index) => Counter(
        id: maps[index]['id'],
        emoji: maps[index]['emoji'],
        name: maps[index]['name'],
        count: maps[index]['count'],
      ),
    );
  }

  Future<void> deleteCounter(String id) async {
    final db = await DB().database();

    await db.delete(
      'counters',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateCounter(Counter counter) async {
    final db = await DB().database();

    await db.update(
      'counters',
      counter.toMap(),
      where: 'id = ?',
      whereArgs: [counter.id],
    );
  }
}
