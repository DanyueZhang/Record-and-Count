import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  Future<void> createTables(Database db) async {
    await db.execute(
        'CREATE TABLE counters(id TEXT PRIMARY KEY, emoji TEXT, name TEXT, count INTEGER)');
    await db.execute(
        'CREATE TABLE events(id TEXT PRIMARY KEY, emoji TEXT, content TEXT, dateTime TEXT)');
  }

  Future<Database> database() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'record_count_database.db'),
      onCreate: (db, version) {
        return createTables(db);
      },
      version: 1,
    );
  }
}