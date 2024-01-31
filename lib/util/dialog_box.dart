import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'my_button.dart';

class DialogBox extends StatefulWidget {
  final dynamic controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        side: BorderSide(color: Colors.white, width: 1.0),
      ),
       contentPadding: const EdgeInsets.all(32.0),

       content: SingleChildScrollView( // Wrap your Column in a SingleChildScrollView
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: [
            // get user input
            TextField(
              controller: widget.controller,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white, // Set the cursor color to white
              decoration: const InputDecoration(
                //border: OutlineInputBorder(),
                hintText: "Add a new task here",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.normal, 
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // date picker
            TextButton(
              onPressed: () => _selectDate(context),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    selectedDate == DateTime.now() ? 'Select a date' : DateFormat('dd - MM - yyyy').format(selectedDate),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // cancel button
                MyButton(
                  text: "Cancel",
                  onPressed: widget.onCancel,
                  backgroundColor: Colors.black,
                  textColor: Colors.white, 
                ),

                const SizedBox(width: 8),

                // save button
                MyButton(
                  text: "Save",
                  onPressed: widget.onSave,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}