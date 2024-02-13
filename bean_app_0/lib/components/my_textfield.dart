import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText; // New parameter
  final bool obscureText;

  const MyTextField(
      {Key? key,
      required this.controller,
      required this.hintText, // Required parameter
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.grey.shade700, width: 3.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.grey, width: 3.0),
          ),
          hintText: hintText, // Use the hintText parameter
          hintStyle: TextStyle(
            color: Color.fromRGBO(108, 87, 7, 1),
            fontSize: 16,
          ),
        ),
        style: TextStyle(color: Color.fromRGBO(184, 148, 7, 1)),
        textAlign: TextAlign.center,
        cursorColor: Colors.grey,
      ),
    );
  }
}
