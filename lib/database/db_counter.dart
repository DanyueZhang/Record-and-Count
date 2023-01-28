import 'package:isar/isar.dart';
import 'package:record_and_count/models/Counter.dart';
import 'package:record_and_count/database/DB.dart';

class DBCounter {
  Future<void> insertCounter(Counter counter) async {
    final isar = await DB().openDB();

    await isar.writeTxn((isar) async {
      await isar.counters.put(counter);
    });
  }

  Future<List<Counter>> getCounters() async {
    final isar = await DB().openDB();

    return await isar.counters.where().findAll();
  }

  Future<void> deleteCounter(int id) async {
    final isar = await DB().openDB();

    await isar.writeTxn((isar) async {
      await isar.counters.delete(id);
    });
  }

  Future<void> updateCounter(Counter counter) async {
    final isar = await DB().openDB();

    await isar.writeTxn((isar) async {
      await isar.counters.put(counter);
    });
  }
}
