import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/util/dialog_box.dart';

class EditTaskDialogBox extends StatelessWidget {
  final TextEditingController taskController;
  final TextEditingController dateController;
  final TextEditingController timeController;
  final Function(String, DateTime, TimeOfDay) onSave;
  final Function() onCancel;

  EditTaskDialogBox({
    Key? key,
    required this.taskController,
    required this.dateController,
    required this.timeController,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  void onDateTap(BuildContext context) async {
    DateTime initialDate = DateFormat('dd-MM-yyyy').parse(dateController.text);

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      dateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
    }
  }

  void onTimeTap(BuildContext context) async {
    TimeOfDay initialTime = TimeOfDay.fromDateTime(DateFormat('HH:mm').parse(timeController.text));
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (pickedTime != null) {
      timeController.text = pickedTime.format(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DialogBox(
      title: 'Edit Task',
      taskController: taskController,
      dateController: dateController,
      timeController: timeController,
      onSave: onSave,
      onCancel: onCancel,
      onDateTap: () => onDateTap(context),
      onTimeTap: () => onTimeTap(context),
    );
  }
}