// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:to_do_app/util/task.dart';
import 'package:to_do_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Task> tasks = [
    Task(name: 'Task 1'),
    Task(name: 'Task 2'),
    Task(name: 'Task 3'),
    Task(name: 'Task 4'),
    // Add more tasks as needed
  ];

  @override
  Widget build(BuildContext context) {
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
              Tab(text: 'Overdue'),
              Tab(text: 'Completed'),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.white,
          ),
        ),
         body: TabBarView(
          children: [
            _buildTaskList(tasks.where((task) => !task.isCompleted).toList()),
            _buildTaskList([]), // You can add logic for 'In Progress' tasks
            _buildTaskList(tasks.where((task) => task.isCompleted).toList()),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: FloatingActionButton(
            onPressed: () {
             
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
        return ToDoTile(
          taskName: tasks[index].name,
          taskCompleted: tasks[index].isCompleted,
          onChanged: (bool? isChecked) {
            setState(() {
              tasks[index].isCompleted = isChecked!;
            });
          },
        );
      },
    );
  }
}
