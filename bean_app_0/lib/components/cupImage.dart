import 'package:bean_app_0/components/cup.dart';
import "package:flutter/material.dart";

class CupImage extends StatelessWidget {
  // final Function()? onTap;
  final Cup data;
  final double size;

  const CupImage(
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
    //124
    //78
    //70
    // int r = 62;
    // int g = 39;
    // int b = 35;

    return Stack(children: [
      Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              color: Color.fromARGB(255, 0, 0, 0),
              width: width,
              height: (data.emptyDisplayLarge + 20) * size,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              color: Colors.white,
              width: width,
              height: data.steamedMilkDisplayLarge * size,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              color: Colors.yellow[100],
              width: width,
              height: data.milkFoamDisplayLarge * size,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              color: Colors.red,
              width: width,
              height: data.syrupSixDisplayLarge * size,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              color: Colors.black,
              width: width,
              height: data.syrupFiveDisplayLarge * size,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              color: Colors.purple,
              width: width,
              height: data.syrupFourDisplayLarge * size,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              color: Colors.orange[900],
              width: width,
              height: data.syrupThreeDisplayLarge * size,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              color: Colors.pink,
              width: width,
              height: data.syrupTwoDisplayLarge * size,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              color: Colors.blue[900],
              width: width,
              height: data.syrupOneDisplayLarge * size,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              //62, 39, 35
              color: Color.fromRGBO(r, g, b, 1),
              width: width,
              height: data.espressoDisplayLarge * size,
            ),
          ],
        ),
      ),
      Center(
        child: Image.asset(
          'lib/images/SmallCup.png',
          height: 149.6 * size,
          width: 200 * size,
        ),
      )
    ]);
  }
}
