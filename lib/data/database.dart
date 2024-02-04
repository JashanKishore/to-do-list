import 'package:hive/hive.dart';
import '../util/task.dart';

class Database {
  final String _boxName = 'tasks';

  Future<Box<Task>> get _box async => await Hive.openBox<Task>(_boxName);

  Future<void> addTask(Task task) async {
    var box = await _box;
    await box.put(task.id, task);
}

  Future<List<Task>> getAllTasks() async {
    var box = await _box;
    return box.values.toList();
  }

  Future<void> deleteTask(dynamic key) async {
    var box = await _box;
    await box.delete(key);
  }

  Future<void> updateIsComplete(dynamic key, Task task) async {
    var box = await _box;
    task.isCompleted = !task.isCompleted;
    await box.put(key, task);
  }

  Future<void> toggleCompleted(dynamic key, Task item) async {
    var box = await _box;
    item.isCompleted = !item.isCompleted;
    await box.put(key, item);
  }

  Future<void> updateTask(dynamic key, Task task) async {
    var box = await _box;
    await box.put(key, task);
  }
}