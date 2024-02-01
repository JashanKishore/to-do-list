import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final DateTime dueDate;
  final Function(bool?)? onChanged;
  final TimeOfDay dueTime;
  final Function(BuildContext)? deleteFunction;

  const ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.dueDate,
    required this.onChanged,
    required this.dueTime,
    this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              backgroundColor: Colors.red,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(8),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  taskName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.white,
                    decorationThickness: 1.0,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      DateFormat('dd-MM-yyyy').format(dueDate), // Display dueDate
                      style: const TextStyle(
                        color: Color.fromARGB(255, 131, 131, 131),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      dueTime.format(context), // Display dueTime
                      style: const TextStyle(
                        color: Color.fromARGB(255, 131, 131, 131),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            leading: Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(
                  color: taskCompleted ? Colors.black : Colors.white,
                ),
              ),
              checkColor: Colors.white,
              activeColor: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}