import 'package:flutter/material.dart';

class EditBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final titleController;
  final descriptionController;
  final String title;
  final String description;
  VoidCallback saved;

  EditBox({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.title,
    required this.description,
    required this.saved,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey,
      content: Container(
        height: 150,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextField(
            controller: titleController,
            style: const TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: Colors.black, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: Colors.black, width: 2),
              ),
              hintText: title,
            ),
            cursorColor: Colors.black,
          ),
          TextField(
            controller: descriptionController,
            style: const TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: Colors.black, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: Colors.black, width: 2),
              ),
              hintText: description,
            ),
            cursorColor: Colors.black,
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            onPressed: saved,
            color: Color.fromRGBO(184, 148, 7, 1),
            child: const Text(
              "Save",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
