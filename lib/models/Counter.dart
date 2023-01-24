import 'package:equatable/equatable.dart';

class Counter extends Equatable {
  final String id;
  final String emoji;
  final String name;
  final int count;

  const Counter({required this.id, required this.emoji, required this.name, this.count = 0});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'emoji': emoji,
      'name': name,
      'count': count,
    };
  }

  @override
  List<Object?> get props => [id];
}