import 'package:flutter/material.dart';

import 'my_button.dart';

class DialogBox extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        side: BorderSide(color: Colors.white, width: 1.0),
      ),
       contentPadding: const EdgeInsets.all(32.0),

      content: SizedBox(
        height: 120,
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: [
            // get user input
            TextField(
              controller: controller,
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

            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // cancel button
                MyButton(
                  text: "Cancel",
                  onPressed: onCancel,
                  backgroundColor: Colors.black,
                  textColor: Colors.white, 
                ),

                const SizedBox(width: 8),

                // save button
                MyButton(
                  text: "Save",
                  onPressed: onSave,
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