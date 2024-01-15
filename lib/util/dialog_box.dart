import 'package:flutter/material.dart';
import 'package:to_do_app/util/task.dart';

class DialogBox {
  static void showAddTaskDialog(BuildContext context, Function(Task) onTaskAdded) {
    TextEditingController textFieldController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Task'),
          content: TextField(
            controller: textFieldController,
            decoration: InputDecoration(
              //labelText: 'Task Name',
              border: OutlineInputBorder(),
              ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Get the task name from the text field
                String taskName = textFieldController.text;

                // Create a new task
                Task newTask = Task(name: taskName, completed: false);

                // Call the callback function to handle the addition of the new task
                onTaskAdded(newTask);

                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
