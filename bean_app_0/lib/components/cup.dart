import 'package:bean_app_0/components/cupData.dart';

class Cup {
  String title;
  String? description;
  double espresso;
  double hotWater;
  double syrupOne;
  double syrupTwo;
  double syrupThree;
  double syrupFour;
  double syrupFive;
  double syrupSix;
  double steamedMilk;
  double milkFoam;
  double emptyDisplaySmall = 0.6;
  late double espressoDisplaySmall;
  late double hotWaterDisplaySmall;
  late double syrupOneDisplaySmall;
  late double syrupTwoDisplaySmall;
  late double syrupThreeDisplaySmall;
  late double syrupFourDisplaySmall;
  late double syrupFiveDisplaySmall;
  late double syrupSixDisplaySmall;
  late double steamedMilkDisplaySmall;
  late double milkFoamDisplaySmall;
  double emptyDisplayLarge = 0.6;
  late double espressoDisplayLarge;
  late double hotWaterDisplayLarge;
  late double syrupOneDisplayLarge;
  late double syrupTwoDisplayLarge;
  late double syrupThreeDisplayLarge;
  late double syrupFourDisplayLarge;
  late double syrupFiveDisplayLarge;
  late double syrupSixDisplayLarge;
  late double steamedMilkDisplayLarge;
  late double milkFoamDisplayLarge;
  late CupData smallCup;
  late CupData largeCup;
  int size = 2;

  Cup({
    required this.title,
    this.description,
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
  }) {
    initialize();
  }

  void initialize() {
    //129
    espressoDisplayLarge = 129 * espresso;
    hotWaterDisplayLarge = 129 * hotWater;
    syrupOneDisplayLarge = 129 * syrupOne;
    syrupTwoDisplayLarge = 129 * syrupTwo;
    syrupThreeDisplayLarge = 129 * syrupThree;
    syrupFourDisplayLarge = 129 * syrupFour;
    syrupFiveDisplayLarge = 129 * syrupFive;
    syrupSixDisplayLarge = 129 * syrupSix;
    steamedMilkDisplayLarge = 129 * steamedMilk;
    milkFoamDisplayLarge = 129 * milkFoam;
    // 8 fl oz
    smallCup = CupData(
      espresso: (8 * espresso).roundToDouble(),
      hotWaterFLoz: (8 * espresso).roundToDouble(),
      syrupOneFLoz: (8 * syrupOne).roundToDouble(),
      syrupTwoFLoz: (8 * syrupTwo).roundToDouble(),
      syrupThreeFLoz: (8 * syrupThree).roundToDouble(),
      syrupFourFLoz: (8 * syrupFour).roundToDouble(),
      syrupFiveFLoz: (8 * syrupFive).roundToDouble(),
      syrupSixFLoz: (8 * syrupSix).roundToDouble(),
      steamedMilkFLoz: (800 * steamedMilk).roundToDouble(),
      milkFoamFLoz: (8 * milkFoam).roundToDouble(),
      size: 8,
    );
    // 16 fl oz
    largeCup = CupData(
      espresso: (16 * espresso).roundToDouble(),
      hotWaterFLoz: (16 * espresso).roundToDouble(),
      syrupOneFLoz: (16 * syrupOne).roundToDouble(),
      syrupTwoFLoz: (16 * syrupTwo).roundToDouble(),
      syrupThreeFLoz: (16 * syrupThree).roundToDouble(),
      syrupFourFLoz: (16 * syrupFour).roundToDouble(),
      syrupFiveFLoz: (16 * syrupFive).roundToDouble(),
      syrupSixFLoz: (16 * syrupSix).roundToDouble(),
      steamedMilkFLoz: (16 * steamedMilk).roundToDouble(),
      milkFoamFLoz: (16 * milkFoam).roundToDouble(),
      size: 16,
    );
  }

  Cup copy() {
    return Cup(
        title: title,
        espresso: espresso,
        hotWater: hotWater,
        syrupOne: syrupOne,
        syrupTwo: syrupTwo,
        syrupThree: syrupThree,
        syrupFour: syrupFour,
        syrupFive: syrupFive,
        syrupSix: syrupSix,
        steamedMilk: steamedMilk,
        milkFoam: milkFoam);
  }

  void updateFromLarge(CupData cup) {
    largeCup = cup;
  }
}
