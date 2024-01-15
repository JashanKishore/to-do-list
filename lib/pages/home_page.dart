// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:to_do_app/util/task.dart';
import 'package:to_do_app/util/task_list.dart';
import 'package:to_do_app/util/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    List<Task> pendingTasks = [Task(name: 'Make an app', completed: false), Task(name: 'Bug testing', completed: false) ];
    List<Task> completedTasks = [];
    List<Task> overdueTasks = [];

    return DefaultTabController(
      length: 3, // Number of tabs
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
              Tab(text: 'Overdue'),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.white,
          ),
        ),
         body: TabBarView(
          children: [
            TaskList(
              tasks: pendingTasks,
              onTaskAdded: (newTask) {
                pendingTasks.add(newTask);
              },
            ), // 'Pending' tab
            TaskList(
              tasks: completedTasks,
              onTaskAdded: (newTask) {
                completedTasks.add(newTask);
              },
            ), // 'Completed' tab
            TaskList(
              tasks: overdueTasks,
              onTaskAdded: (newTask) {
                overdueTasks.add(newTask);
              },
            ), // 'Overdue' tab
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: FloatingActionButton(
            onPressed: () {
              // Show a dialog or directly add a task when the button is pressed
              DialogBox.showAddTaskDialog(context, (newTask) {
                pendingTasks.add(newTask); // Assuming 'Pending' tab is selected
              });
            },
            child: Icon(
              Icons.add,
              size: 30.0,
              color: Colors.white,
              ),
            backgroundColor: Colors.black,
            shape: CircleBorder(side: BorderSide(color: Colors.white, width: 1.0)),
          ),
        ),
      ),
    );
  }
}