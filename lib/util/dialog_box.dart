// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'my_button.dart';

class DialogBox extends StatefulWidget {
  final dynamic controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
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
     DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
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
      title: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Text(
          "Create new task",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        side: BorderSide(color: Colors.white, width: 1.0),
      ),
       contentPadding: const EdgeInsets.all(32.0),

       content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.controller,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white, // Set the cursor color to white
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.edit, color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: "Task name",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.normal, 
                        fontWeight: FontWeight.w400,
                      ),
                      //border: InputBorder.none, // Remove the border to make it look like the DatePicker
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // date picker
            TextField(
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.calendar_today, color: Colors.white),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: 'Due date',
                hintStyle: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.normal, 
                        fontWeight: FontWeight.w400,
                      ),    
              ),
            ),

            const SizedBox(height: 32),

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