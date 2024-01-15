// task_list.dart

import 'package:flutter/material.dart';
import 'package:to_do_app/util/todo_tile.dart';
import 'package:to_do_app/util/task.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;  // Define the named parameter 'tasks'

  TaskList({required this.tasks});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return ToDoTile(
          taskName: widget.tasks[index].name,
          taskCompleted: widget.tasks[index].completed,
          onChanged: (bool? value) {
            setState(() {
              widget.tasks[index].completed = value ?? false;
            });
          },
        );
      },
    );
  }
}
