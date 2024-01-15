import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ToDoTile({
    Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  }) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskName,
      style: TextStyle(
          fontSize: 16.0, 
          fontWeight: FontWeight.bold,
          color: Colors.white,
          decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
          decorationColor: Colors.white, // Change the line color
          decorationThickness: 2.0, // Adjust the line thickness
          decorationStyle: TextDecorationStyle.solid, // Change the line style if needed
        ),
      ),
      leading: Checkbox(
        value: taskCompleted,
        onChanged: onChanged,
      ),
    );
  }
}