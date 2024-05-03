import 'package:bean_app_0/components/cupData.dart';

class Cup {
  String title;
  String? description;
  double heat;
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
  double empty;
  late double emptyDisplaySmall = 0.6;
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
  late double emptyDisplayLarge = 0.6;
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
    required this.heat,
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
    emptyDisplayLarge = 0.6 + (129 * empty);
    // 8 fl oz
    smallCup = CupData(
      espresso: ((800 * espresso).roundToDouble()) / 100,
      hotWaterFLoz: ((800 * hotWater).roundToDouble()) / 100,
      syrupOneFLoz: ((800 * syrupOne).roundToDouble()) / 100,
      syrupTwoFLoz: ((800 * syrupTwo).roundToDouble()) / 100,
      syrupThreeFLoz: ((800 * syrupThree).roundToDouble()) / 100,
      syrupFourFLoz: ((800 * syrupFour).roundToDouble()) / 100,
      syrupFiveFLoz: ((800 * syrupFive).roundToDouble()) / 100,
      syrupSixFLoz: ((800 * syrupSix).roundToDouble()) / 100,
      steamedMilkFLoz: ((800 * steamedMilk).roundToDouble()) / 100,
      milkFoamFLoz: ((800 * milkFoam).roundToDouble()) / 100,
      size: 8,
      empty: ((800 * empty).roundToDouble()) / 100,
    );
    // 16 fl oz
    largeCup = CupData(
      espresso: ((1600 * espresso).roundToDouble()) / 100,
      hotWaterFLoz: ((1600 * hotWater).roundToDouble()) / 100,
      syrupOneFLoz: ((1600 * syrupOne).roundToDouble()) / 100,
      syrupTwoFLoz: ((1600 * syrupTwo).roundToDouble()) / 100,
      syrupThreeFLoz: ((1600 * syrupThree).roundToDouble()) / 100,
      syrupFourFLoz: ((1600 * syrupFour).roundToDouble()) / 100,
      syrupFiveFLoz: ((1600 * syrupFive).roundToDouble()) / 100,
      syrupSixFLoz: ((1600 * syrupSix).roundToDouble()) / 100,
      steamedMilkFLoz: ((1600 * steamedMilk).roundToDouble()) / 100,
      milkFoamFLoz: ((1600 * milkFoam).roundToDouble()) / 100,
      size: 16,
      empty: ((1600 * empty).roundToDouble()) / 100,
    );
  }

  Cup copy() {
    return Cup(
      title: title,
      description: description,
      heat: heat,
      espresso: espresso,
      hotWater: hotWater,
      syrupOne: syrupOne,
      syrupTwo: syrupTwo,
      syrupThree: syrupThree,
      syrupFour: syrupFour,
      syrupFive: syrupFive,
      syrupSix: syrupSix,
      steamedMilk: steamedMilk,
      milkFoam: milkFoam,
      empty: empty,
    );
  }

  void updateEspresso(double newEspresso, double size, double empty) {
    double percentage = newEspresso / size;
    this.empty = empty / size;
    emptyDisplayLarge = 129 * this.empty;
    largeCup.empty = ((1600 * this.empty).roundToDouble()) / 100;
    smallCup.empty = ((800 * this.empty).roundToDouble()) / 100;

    espresso = percentage;
    espressoDisplayLarge = 129 * percentage;
    // this.espressoDisplaySmall =
    largeCup.espresso = ((1600 * espresso).roundToDouble()) / 100;
    smallCup.espresso = ((800 * espresso).roundToDouble()) / 100;

    largeCup.updatePrice();
    smallCup.updatePrice();
  }

  void updateMilkFoam(double newMilkFoam, double size, double empty) {
    double percentage = newMilkFoam / size;

    this.empty = empty / size;
    emptyDisplayLarge = 129 * this.empty;
    largeCup.empty = ((1600 * this.empty).roundToDouble()) / 100;
    smallCup.empty = ((800 * this.empty).roundToDouble()) / 100;

    milkFoam = percentage;
    milkFoamDisplayLarge = 129 * percentage;
    // this.espressoDisplaySmall =
    largeCup.milkFoamFLoz = ((1600 * milkFoam).roundToDouble()) / 100;
    smallCup.milkFoamFLoz = ((800 * milkFoam).roundToDouble()) / 100;

    largeCup.updatePrice();
    smallCup.updatePrice();
  }

  void updateSteamedMilk(double newSteamedMilk, double size, double empty) {
    double percentage = newSteamedMilk / size;

    this.empty = empty / size;
    emptyDisplayLarge = 129 * this.empty;
    largeCup.empty = ((1600 * this.empty).roundToDouble()) / 100;
    smallCup.empty = ((800 * this.empty).roundToDouble()) / 100;

    steamedMilk = percentage;
    steamedMilkDisplayLarge = 129 * percentage;
    // this.espressoDisplaySmall =
    largeCup.steamedMilkFLoz = ((1600 * steamedMilk).roundToDouble()) / 100;
    smallCup.steamedMilkFLoz = ((800 * steamedMilk).roundToDouble()) / 100;

    largeCup.updatePrice();
    smallCup.updatePrice();
  }

  void updateHotWater(double newHotWater, double size, double empty) {
    double percentage = newHotWater / size;

    this.empty = empty / size;
    emptyDisplayLarge = 129 * this.empty;
    largeCup.empty = ((1600 * this.empty).roundToDouble()) / 100;
    smallCup.empty = ((800 * this.empty).roundToDouble()) / 100;

    hotWater = percentage;
    hotWaterDisplayLarge = 129 * percentage;
    // this.espressoDisplaySmall =
    largeCup.hotWaterFLoz = ((1600 * hotWater).roundToDouble()) / 100;
    smallCup.hotWaterFLoz = ((800 * hotWater).roundToDouble()) / 100;

    largeCup.updatePrice();
    smallCup.updatePrice();
  }

  void updateSyrupOne(double newSyrupOne, double size, double empty) {
    double percentage = newSyrupOne / size;

    this.empty = empty / size;
    emptyDisplayLarge = 129 * this.empty;
    largeCup.empty = ((1600 * this.empty).roundToDouble()) / 100;
    smallCup.empty = ((800 * this.empty).roundToDouble()) / 100;

    syrupOne = percentage;
    syrupOneDisplayLarge = 129 * percentage;
    // espressoDisplaySmall =
    largeCup.syrupOneFLoz = ((1600 * syrupOne).roundToDouble()) / 100;
    smallCup.syrupOneFLoz = ((800 * syrupOne).roundToDouble()) / 100;

    largeCup.updatePrice();
    smallCup.updatePrice();
  }

  void updateSyrupTwo(double newSyrupTwo, double size, double empty) {
    double percentage = newSyrupTwo / size;

    this.empty = empty / size;
    emptyDisplayLarge = 129 * this.empty;
    largeCup.empty = ((1600 * this.empty).roundToDouble()) / 100;
    smallCup.empty = ((800 * this.empty).roundToDouble()) / 100;

    syrupTwo = percentage;
    syrupTwoDisplayLarge = 129 * percentage;
    // this.espressoDisplaySmall =
    largeCup.syrupTwoFLoz = ((1600 * syrupTwo).roundToDouble()) / 100;
    smallCup.syrupTwoFLoz = ((800 * syrupTwo).roundToDouble()) / 100;

    largeCup.updatePrice();
    smallCup.updatePrice();
  }

  void updateSyrupThree(double newSyrupThree, double size, double empty) {
    double percentage = newSyrupThree / size;

    this.empty = empty / size;
    emptyDisplayLarge = 129 * this.empty;
    largeCup.empty = ((1600 * this.empty).roundToDouble()) / 100;
    smallCup.empty = ((800 * this.empty).roundToDouble()) / 100;

    syrupThree = percentage;
    syrupThreeDisplayLarge = 129 * percentage;
    // this.espressoDisplaySmall =
    largeCup.syrupThreeFLoz = ((1600 * syrupThree).roundToDouble()) / 100;
    smallCup.syrupThreeFLoz = ((800 * syrupThree).roundToDouble()) / 100;

    largeCup.updatePrice();
    smallCup.updatePrice();
  }

  void updateSyrupFour(double newSyrupFour, double size, double empty) {
    double percentage = newSyrupFour / size;

    this.empty = empty / size;
    emptyDisplayLarge = 129 * this.empty;
    largeCup.empty = ((1600 * this.empty).roundToDouble()) / 100;
    smallCup.empty = ((800 * this.empty).roundToDouble()) / 100;

    syrupFour = percentage;
    syrupFourDisplayLarge = 129 * percentage;
    // this.espressoDisplaySmall =
    largeCup.syrupFourFLoz = ((1600 * syrupFour).roundToDouble()) / 100;
    smallCup.syrupFourFLoz = ((800 * syrupFour).roundToDouble()) / 100;

    largeCup.updatePrice();
    smallCup.updatePrice();
  }

  void updateSyrupFive(double newSyrupFive, double size, double empty) {
    double percentage = newSyrupFive / size;

    this.empty = empty / size;
    emptyDisplayLarge = 129 * this.empty;
    largeCup.empty = ((1600 * this.empty).roundToDouble()) / 100;
    smallCup.empty = ((800 * this.empty).roundToDouble()) / 100;

    syrupFive = percentage;
    syrupFiveDisplayLarge = 129 * percentage;
    // this.espressoDisplaySmall =
    largeCup.syrupFiveFLoz = ((1600 * syrupFive).roundToDouble()) / 100;
    smallCup.syrupFiveFLoz = ((800 * syrupFive).roundToDouble()) / 100;

    largeCup.updatePrice();
    smallCup.updatePrice();
  }
}
