// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: Text('TO DO',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      elevation: 0,
      backgroundColor: Colors.black,
      shadowColor: Colors.white,
      shape: Border(
          bottom: BorderSide(color: Colors.white, width: 1.0), // Set the border width
        ),
      ),
    );
  }
}