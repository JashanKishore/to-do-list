// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/setupLocator.dart';
import 'package:to_do_app/util/task.dart';
import 'package:to_do_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  final List<Task> todos;

  HomePage(this.todos);
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Database _dbService = locator<Database>();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        backgroundColor: Colors.black,

        appBar: AppBar(
          title: Text(
            'TO DO',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          elevation: 0,
          backgroundColor: Colors.black,
          shadowColor: Colors.white,
          shape: Border(
            bottom: BorderSide(color: Colors.white, width: 2.0),
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Pending'),
              Tab(text: 'Completed'),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            ValueListenableBuilder(
              valueListenable: Hive.box<Task>('tasks').listenable(),
              builder: (context, Box<Task> box, _) {
                var pendingTasks = box.values.where((task) => !task.isCompleted).toList();
                return _buildTaskList(pendingTasks);
              },
            ),
            ValueListenableBuilder(
              valueListenable: Hive.box<Task>('tasks').listenable(),
              builder: (context, Box<Task> box, _) {
                var completedTasks = box.values.where((task) => task.isCompleted).toList();
                return _buildTaskList(completedTasks);
              },
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DialogBox(
                    controller: _controller,
                    onSave: () {
                      if (_controller.text.isNotEmpty) {
                          var todo = Task(name: _controller.text, isCompleted: false);
                          _dbService.addTask(todo);
                          _controller.clear();
                          Navigator.pop(context);
                        }
                    },
                    onCancel: () {
                      _controller.clear();
                      Navigator.pop(context);
                    },
                  );
                },
              );
            },
            backgroundColor: Colors.black,
            shape: CircleBorder(side: BorderSide(color: Colors.white, width: 1.0)),
            child: Icon(
              Icons.add,
              size: 30.0,
              color: Colors.white,
              ),
          ),
        ),
      ),
    );
  }

    Widget _buildTaskList(List<Task> tasks) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        var todo = tasks[index];
        return ToDoTile(
          taskName: todo.name,
          taskCompleted: todo.isCompleted,
          onChanged: (val) {
            _dbService.toggleCompleted(index, todo);
          },
          deleteFunction: (context) {
            _dbService.deleteTask(index);
          },
        );
      },
    );
  }

}


