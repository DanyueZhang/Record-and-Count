import 'package:isar/isar.dart';

part 'Counter.g.dart';

@Collection()
class Counter {
  int id = Isar.autoIncrement;
  String emoji;
  String name;
  int count;

  Counter({required this.emoji, required this.name, this.count = 0});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'emoji': emoji,
      'name': name,
      'count': count,
    };
  }

  @override
  bool operator ==(Object other) =>
      other is Counter &&
          other.runtimeType == runtimeType &&
          other.id == id;

  @override
  int get hashCode => id.hashCode;
}