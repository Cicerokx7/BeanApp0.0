import "package:flutter/material.dart";

class LoginButtonB extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const LoginButtonB({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FittedBox(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          // margin: const EdgeInsets.symmetric(horizontal: 100),
          // width: 125,
          decoration: BoxDecoration(
              // color: const Color.fromRGBO(184, 148, 7, 1),
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(50)),
          child: Center(
              child: Text(text,
                  style: const TextStyle(
                      color: Colors.black,
                      // color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 20))),
        ),
      ),
    );
  }
}
