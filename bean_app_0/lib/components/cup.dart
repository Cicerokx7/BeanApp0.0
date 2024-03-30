import "package:flutter/material.dart";

class Cup extends StatelessWidget {
  // final Function()? onTap;
  final String title;
  final double? espresso;
  final double? hotWater;
  final double? syrupOne;
  final double? syrupTwo;
  final double? syrupThree;
  final double? syrupFour;
  final double? syrupFive;
  final double? syrupSix;
  final double? steamedMilk;
  final double? milkFoam;

  const Cup({
    super.key,
    // required this.onTap,
    required this.title,
    this.espresso,
    this.hotWater,
    this.syrupOne,
    this.syrupTwo,
    this.syrupThree,
    this.syrupFour,
    this.syrupFive,
    this.syrupSix,
    this.steamedMilk,
    this.milkFoam,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 180,
      // decoration: BoxDecoration(),
      child: Column(
        children: [Image.asset('lib/images/tempCoffeeCup.jpg')],
      ),
    );
  }
}
