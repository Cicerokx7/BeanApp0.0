import "package:flutter/material.dart";

class Cup extends StatelessWidget {
  // final Function()? onTap;
  final String title;
  final double espresso;
  final double hotWater;
  final double syrupOne;
  final double syrupTwo;
  final double syrupThree;
  final double syrupFour;
  final double syrupFive;
  final double syrupSix;
  final double steamedMilk;
  final double milkFoam;
  final double empty;

  const Cup({
    super.key,
    // required this.onTap,
    required this.title,
    required this.espresso,
    required this.hotWater,
    required this.syrupOne,
    required this.syrupTwo,
    required this.syrupThree,
    required this.syrupFour,
    required this.syrupFive,
    required this.syrupSix,
    required this.steamedMilk,
    required this.milkFoam,
    required this.empty,
  });

  @override
  Widget build(BuildContext context) {
    const double width = 110;

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
                    height: empty + 20,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    color: Colors.white,
                    width: width,
                    height: steamedMilk,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    color: Colors.yellow[100],
                    width: width,
                    height: milkFoam,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    color: Colors.red,
                    width: width,
                    height: syrupSix,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    color: Colors.black,
                    width: width,
                    height: syrupFive,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    color: Colors.purple,
                    width: width,
                    height: syrupFour,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    color: Colors.orange[900],
                    width: width,
                    height: syrupThree,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    color: Colors.pink,
                    width: width,
                    height: syrupTwo,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    color: Colors.blue[900],
                    width: width,
                    height: syrupOne,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    color: Colors.blue[300],
                    width: width,
                    height: hotWater,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    color: Colors.brown[900],
                    width: width,
                    height: espresso,
                  ),
                ],
              ),
            ),
            Center(
              child: Image.asset(
                'lib/images/SmallCup.png',
                height: 149.6,
                width: 200,
              ),
            )
          ]),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
