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
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Container(
         decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.circular(8)
        ),
        child: ListTile(
          title: Text(taskName,
          style: TextStyle(
              color: Colors.white,
              decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
              decorationColor: Colors.white, 
              decorationThickness: 1.0, 
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
          leading: Checkbox(
            value: taskCompleted,
            onChanged: onChanged,
            activeColor: Colors.black,
            checkColor: Colors.white,
          ),
        ),
      ),
    );
  }
}