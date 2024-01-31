import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  var uuid = const Uuid();
  
  @HiveField(0)
  String id;                 
  
  @HiveField(1)
  String name;                

  @HiveField(2, defaultValue: false)
  bool isCompleted;       

@HiveField(3)
  DateTime? dueDate = DateTime.now();

  Task({
    required this.name,
    required this.isCompleted,
    this.dueDate,
  }) : id = const Uuid().v1();
}
