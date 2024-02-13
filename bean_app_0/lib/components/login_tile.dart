import 'package:flutter/material.dart';

class LoginTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const LoginTile({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          child: Image.asset(
        imagePath,
        height: 72,
        color: Color.fromRGBO(184, 148, 7, 1),
      )),
    );
  }
}
