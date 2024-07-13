import 'package:bean_app_0/components/cup.dart';
import 'package:bean_app_0/components/cupImage.dart';
import "package:flutter/material.dart";

class CupCard extends StatelessWidget {
  final Cup data;
  final double size;

  const CupCard(
      {super.key,
      // required this.onTap,
      required this.data,
      required this.size});

  @override
  Widget build(BuildContext context) {
    double width = 110.0 * size;
    double perc = 0;
    if (data.espresso != 0 || data.hotWater != 0) {
      perc = (data.hotWater / (data.espresso + data.hotWater));
    }
    int r = (31 + (70 * perc)).round();
    int g = (19 + (44 * perc)).round();
    int b = (17 + (40 * perc)).round();
    if (data.espresso == 0) {
      r = 26;
      g = 135;
      b = 199;
    }
    // int r = 62;
    // int g = 39;
    // int b = 35;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupImage(data: data, size: size),
          GestureDetector(
            onLongPress: () {},
            child: Text(
              data.title,
              style: TextStyle(color: Colors.white, fontSize: 14 * size),
            ),
          )
        ],
      ),
    );
  }
}
