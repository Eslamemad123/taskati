import 'package:hive/hive.dart';
part 'task model.g.dart';

@HiveType(typeId: 0)
class Task_Model {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String describtion;
  @HiveField(3)
  final String startTime;
  @HiveField(4)
  final String EndTime;
  @HiveField(5)
  final String date;
  @HiveField(6)
  final int color;
  @HiveField(7)
  final bool isComplete;

  Task_Model({
    required this.id,
    required this.title,
    required this.describtion,
    required this.startTime,
    required this.EndTime,
    required this.date,
    required this.color,
    required this.isComplete,
  });
  copyWith({
    String? title,
    String? description,
    String? date,
    String? startTime,
    String? endTime,
    int? color,
    bool? isCompleted,
  }) {
    return (Task_Model(
      id: id,
      title: title ?? this.title,
      describtion: description ?? describtion,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      EndTime: endTime ?? EndTime,
      color: color ?? this.color,
      isComplete: isCompleted ?? isComplete,
    ));
  }
}
