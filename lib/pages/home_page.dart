// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Center(child: Text('Pending Tasks')),
            Center(child: Text('Completed Tasks')),
            Center(child: Text('Overdue Tasks')),
          ],
        ),
      ),
    );
  }
}