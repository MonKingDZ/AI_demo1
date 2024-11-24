import 'package:flutter/material.dart';
import 'package:todolist1/utilities/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // input text
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: "Creat a new task here",
                labelStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Type Something",
                hintStyle: TextStyle(color: Colors.grey[500]),
              ),
            ),

            // cancle button & done button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Done Button
                MyButton(text: "Done", onPressed: onSave),
                // space
                SizedBox(width: 8),
                // Cancle Button
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
