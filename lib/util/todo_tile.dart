import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  const ToDoTile({
    Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    this.deleteFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction, backgroundColor: Colors.red, icon: Icons.delete, borderRadius: BorderRadius.circular(8),)
          ],
        ),
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
            ),
          ),
        ),
      ),
    );
  }
}