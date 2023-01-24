import 'package:flutter/foundation.dart';
import 'package:record_and_count/database/db_counter.dart';
import 'package:record_and_count/models/Counter.dart';
import 'package:uuid/uuid.dart';

class CounterProvider extends ChangeNotifier {
  List<Counter> counters = [];
  
  Future<void> addCounter(String emoji, String name, int count) async {
    Counter counter = Counter(id: const Uuid().v1(), emoji: emoji, name: name, count: count);

    await DBCounter().insertCounter(counter);

    await getCounters();
  }

  Future<void> getCounters() async {
    counters = await DBCounter().getCounters();

    notifyListeners();
  }

  Future<void> deleteCounters(String id) async {
    await DBCounter().deleteCounter(id);

    await getCounters();
  }

  Future<void> updateCounters(Counter counter, String emoji, String name, int count) async {
    Counter newCounter = Counter(id: counter.id, emoji: counter.emoji, name: name, count: count);

    await DBCounter().updateCounter(newCounter);

    await getCounters();
  }

  Future<void> increaseCount(Counter counter) async {
    await updateCounters(counter, counter.emoji, counter.name, counter.count + 1);
  }

  Future<void> decreaseCount(Counter counter) async {
    if (counter.count > 0) {
      await updateCounters(counter, counter.emoji, counter.name, counter.count - 1);
    }
  }
}