import "package:flutter/material.dart";

class UnusedIngredient extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const UnusedIngredient({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          this.text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        GestureDetector(
          onTap: onTap,
          child: FittedBox(
            child: Container(
              // padding: const EdgeInsets.all(7),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
              // width: 200,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(184, 148, 7, 1),
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                  child: Text("Add",
                      style: const TextStyle(
                          color: Colors.black,
                          // color: Colors.grey[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 24))),
            ),
          ),
        ),
      ],
    );
  }
}
