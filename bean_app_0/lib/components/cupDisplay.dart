import 'package:bean_app_0/components/cup.dart';
import "package:flutter/material.dart";

class CupDisplay extends StatelessWidget {
  // final Function()? onTap;
  final Cup data;
  final double size;

  const CupDisplay(
      {super.key,
      // required this.onTap,
      required this.data,
      required this.size});

  @override
  Widget build(BuildContext context) {
    double width = 110.0 * size;

    return Container(
      // margin: EdgeInsets.only(left: 25),
      // width: 180,
      // decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(children: [
            Center(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    color: Colors.black,
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
                    color: Colors.blue[300],
                    width: width,
                    height: data.hotWaterDisplayLarge * size,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    color: Colors.brown[900],
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
          ]),
          Text(
            data.title,
            style: TextStyle(color: Colors.white, fontSize: 14 * size),
          )
        ],
      ),
    );
  }
}
