//This class is used to create a new item or queue.

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditTextBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controllerTitle;
  final controllerDescription;
  VoidCallback saved;

  EditTextBox({
    super.key,
    required this.controllerTitle,
    required this.controllerDescription,
    required this.saved,
  });

  @override
  Widget build(BuildContext context) {
    //Display a box in front of the home page.
    return AlertDialog(
      backgroundColor: Color.fromRGBO(184, 148, 7, 1),
      content: Container(
        // height: 150,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Title",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              TextField(
                  controller: controllerTitle,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  cursorColor: Colors.black,
                  onSubmitted: (String value) {
                    saved();
                  }),
              const Text(
                "Description",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              TextField(
                  maxLines: null,
                  controller: controllerDescription,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  cursorColor: Colors.black,
                  onSubmitted: (String value) {
                    saved();
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  onPressed: saved,
                  color: Colors.black,
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(184, 148, 7, 1),
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
