import 'package:hive/hive.dart';
import '../util/task.dart';

class Database {
  final String _boxName = 'tasks';

  Future<Box<Task>> get _box async => await Hive.openBox<Task>(_boxName);

  Future<void> addTask(Task task) async {
    var box = await _box;
    await box.add(task);
  }

  Future<List<Task>> getAllTasks() async {
    var box = await _box;
    return box.values.toList();
  }

  Future<void> deleteTask(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }

  Future<void> updateIsComplete(int index, Task task) async {
    var box = await _box;
    task.isCompleted = !task.isCompleted;
    await box.put(index, task);
  }

  Future<void> toggleCompleted(int index, Task item) async {
    var box = await _box;
    item.isCompleted = !item.isCompleted;
    await box.putAt(index, item);
  }
}