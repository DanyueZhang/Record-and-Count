import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Event extends Equatable {
  final String id;
  final String emoji;
  final String content;
  final DateTime dateTime;

  const Event({required this.id, required this.emoji, required this.content, required this.dateTime});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'emoji': emoji,
      'content': content,
      'dateTime': DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime),
    };
  }

  @override
  List<Object?> get props => [id];
}