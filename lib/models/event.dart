import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

part 'event.g.dart';

@Collection()
class Event{
  int id = Isar.autoIncrement;
  String emoji;
  String content;
  final DateTime dateTime;

  Event({required this.emoji, required this.content, required this.dateTime});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'emoji': emoji,
      'content': content,
      'dateTime': DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime),
    };
  }

  @override
  bool operator ==(Object other) =>
      other is Event &&
          other.runtimeType == runtimeType &&
          other.id == id;

  @override
  int get hashCode => id.hashCode;
}