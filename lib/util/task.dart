import 'package:flutter/material.dart';
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
  DateTime dueDate;

@HiveField(4)
  TimeOfDay dueTime;

  Task({
    required this.name,
    required this.isCompleted,
    required this.dueDate,
    required this.dueTime,
  }) : id = const Uuid().v1();
}
