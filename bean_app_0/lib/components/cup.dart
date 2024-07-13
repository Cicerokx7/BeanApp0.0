import 'package:bean_app_0/components/cupData.dart';

class Cup {
  bool custom;
  String title;
  String? description;
  double heat;
  double espresso;
  bool caffeinated;
  double hotWater;
  double syrupOne;
  double syrupTwo;
  double syrupThree;
  double syrupFour;
  double syrupFive;
  double syrupSix;
  double steamedMilk;
  double milkFoam;
  bool wholeMilk;
  double empty;
  late double emptyDisplaySmall = 0.6;
  late double espressoDisplaySmall;
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
    required this.custom,
    required this.title,
    this.description,
    required this.heat,
    required this.espresso,
    required this.caffeinated,
    required this.hotWater,
    required this.syrupOne,
    required this.syrupTwo,
    required this.syrupThree,
    required this.syrupFour,
    required this.syrupFive,
    required this.syrupSix,
    required this.steamedMilk,
    required this.milkFoam,
    required this.wholeMilk,
    required this.empty,
  }) {
    initialize();
  }

  void initialize() {
    //127
    espressoDisplayLarge = 127 * (espresso + hotWater);
    hotWaterDisplayLarge = 0;
    syrupOneDisplayLarge = 127 * syrupOne;
    syrupTwoDisplayLarge = 127 * syrupTwo;
    syrupThreeDisplayLarge = 127 * syrupThree;
    syrupFourDisplayLarge = 127 * syrupFour;
    syrupFiveDisplayLarge = 127 * syrupFive;
    syrupSixDisplayLarge = 127 * syrupSix;
    steamedMilkDisplayLarge = 127 * steamedMilk;
    milkFoamDisplayLarge = 127 * milkFoam;
    emptyDisplayLarge = 0.6 + (127 * empty);
    // 8 fl oz
    smallCup = CupData(
      espresso: (8 * espresso).roundToDouble(),
      hotWaterFLoz: ((800 * hotWater).roundToDouble()) / 100,
      syrupOneFLoz: (8 * syrupOne).roundToDouble(),
      syrupTwoFLoz: (8 * syrupTwo).roundToDouble(),
      syrupThreeFLoz: (8 * syrupThree).roundToDouble(),
      syrupFourFLoz: (8 * syrupFour).roundToDouble(),
      syrupFiveFLoz: (8 * syrupFive).roundToDouble(),
      syrupSixFLoz: (8 * syrupSix).roundToDouble(),
      steamedMilkFLoz: ((800 * steamedMilk).roundToDouble()) / 100,
      milkFoamFLoz: ((800 * milkFoam).roundToDouble()) / 100,
      size: 8,
      empty: ((800 * empty).roundToDouble()) / 100,
    );
    // 16 fl oz
    largeCup = CupData(
      espresso: (16 * espresso).roundToDouble(),
      hotWaterFLoz: ((1600 * hotWater).roundToDouble()) / 100,
      syrupOneFLoz: (16 * syrupOne).roundToDouble(),
      syrupTwoFLoz: (16 * syrupTwo).roundToDouble(),
      syrupThreeFLoz: (16 * syrupThree).roundToDouble(),
      syrupFourFLoz: (16 * syrupFour).roundToDouble(),
      syrupFiveFLoz: (16 * syrupFive).roundToDouble(),
      syrupSixFLoz: (16 * syrupSix).roundToDouble(),
      steamedMilkFLoz: ((1600 * steamedMilk).roundToDouble()) / 100,
      milkFoamFLoz: ((1600 * milkFoam).roundToDouble()) / 100,
      size: 16,
      empty: ((1600 * empty).roundToDouble()) / 100,
    );
  }

  Cup copy() {
    return Cup(
      custom: custom,
      title: title,
      description: description,
      heat: heat,
      espresso: espresso,
      caffeinated: caffeinated,
      hotWater: hotWater,
      syrupOne: syrupOne,
      syrupTwo: syrupTwo,
      syrupThree: syrupThree,
      syrupFour: syrupFour,
      syrupFive: syrupFive,
      syrupSix: syrupSix,
      steamedMilk: steamedMilk,
      milkFoam: milkFoam,
      wholeMilk: wholeMilk,
      empty: empty,
    );
  }

  bool equals(Cup cup) {
    return ((cup.title == title) &&
        (cup.description == description) &&
        (cup.heat == heat) &&
        (cup.espresso == espresso) &&
        (cup.hotWater == hotWater) &&
        (cup.syrupOne == syrupOne) &&
        (cup.syrupTwo == syrupTwo) &&
        (cup.syrupThree == syrupThree) &&
        (cup.syrupFour == syrupFour) &&
        (cup.syrupFive == syrupFive) &&
        (cup.syrupSix == syrupSix) &&
        (cup.steamedMilk == steamedMilk) &&
        (cup.milkFoam == milkFoam));
  }

  void updateEspresso(double newEspresso, double size, double empty) {
    //Shot = 1 fl oz

    double percentage = newEspresso / size;
    this.empty = empty / size;
    emptyDisplayLarge = 127 * this.empty;
    largeCup.empty = ((1600 * this.empty).roundToDouble()) / 100;
    smallCup.empty = ((800 * this.empty).roundToDouble()) / 100;

    espresso = percentage;
    espressoDisplayLarge = 127 * (percentage + hotWater);
    // this.espressoDisplaySmall =
    largeCup.espresso = (16 * espresso).roundToDouble();
    smallCup.espresso = (8 * espresso).roundToDouble();

    largeCup.updatePrice();
    smallCup.updatePrice();
  }

  void updateMilkFoam(double newMilkFoam, double size, double empty) {
    double percentage = newMilkFoam / size;

    this.empty = empty / size;
    emptyDisplayLarge = 127 * this.empty;
    largeCup.empty = ((1600 * this.empty).roundToDouble()) / 100;
    smallCup.empty = ((800 * this.empty).roundToDouble()) / 100;

    milkFoam = percentage;
    milkFoamDisplayLarge = 127 * percentage;
    // this.espressoDisplaySmall =
    largeCup.milkFoamFLoz = ((1600 * milkFoam).roundToDouble()) / 100;
    smallCup.milkFoamFLoz = ((800 * milkFoam).roundToDouble()) / 100;

    largeCup.updatePrice();
    smallCup.updatePrice();
  }

  void updateSteamedMilk(double newSteamedMilk, double size, double empty) {
    double percentage = newSteamedMilk / size;

    this.empty = empty / size;
    emptyDisplayLarge = 127 * this.empty;
    largeCup.empty = ((1600 * this.empty).roundToDouble()) / 100;
    smallCup.empty = ((800 * this.empty).roundToDouble()) / 100;

    steamedMilk = percentage;
    steamedMilkDisplayLarge = 127 * percentage;
    // this.espressoDisplaySmall =
    largeCup.steamedMilkFLoz = ((1600 * steamedMilk).roundToDouble()) / 100;
    smallCup.steamedMilkFLoz = ((800 * steamedMilk).roundToDouble()) / 100;

    largeCup.updatePrice();
    smallCup.updatePrice();
  }

  void updateHotWater(double newHotWater, double size, double empty) {
    double percentage = newHotWater / size;

    this.empty = empty / size;
    emptyDisplayLarge = 127 * this.empty;
    largeCup.empty = ((1600 * this.empty).roundToDouble()) / 100;
    smallCup.empty = ((800 * this.empty).roundToDouble()) / 100;

    hotWater = percentage;
    espressoDisplayLarge = 127 * (percentage + espresso);
    // this.espressoDisplaySmall =
    largeCup.hotWaterFLoz = ((1600 * hotWater).roundToDouble()) / 100;
    smallCup.hotWaterFLoz = ((800 * hotWater).roundToDouble()) / 100;

    largeCup.updatePrice();
    smallCup.updatePrice();
  }

  void updateSyrupOne(double newSyrupOne, double size, double empty) {
    //Pump = 0.5 fl oz
    double percentage = newSyrupOne / size;
    this.empty = empty / size;
    emptyDisplayLarge = 127 * this.empty;

    largeCup.empty = ((1600 * this.empty).roundToDouble()) / 100;
    smallCup.empty = ((800 * this.empty).roundToDouble()) / 100;

    syrupOne = percentage;
    syrupOneDisplayLarge = 127 * percentage;

    largeCup.syrupOneFLoz = (16 * syrupOne).roundToDouble();
    smallCup.syrupOneFLoz = (8 * syrupOne).roundToDouble();

    largeCup.updatePrice();
    smallCup.updatePrice();
  }

  void updateSyrupTwo(double newSyrupTwo, double size, double empty) {
    // pump = 0.5 fl oz

    double percentage = newSyrupTwo / size;

    this.empty = empty / size;
    emptyDisplayLarge = 127 * this.empty;
    largeCup.empty = ((1600 * this.empty).roundToDouble()) / 100;
    smallCup.empty = ((800 * this.empty).roundToDouble()) / 100;

    syrupTwo = percentage;
    syrupTwoDisplayLarge = 127 * percentage;

    largeCup.syrupTwoFLoz = (16 * syrupTwo).roundToDouble();
    smallCup.syrupTwoFLoz = (8 * syrupTwo).roundToDouble();

    largeCup.updatePrice();
    smallCup.updatePrice();
  }

  void updateSyrupThree(double newSyrupThree, double size, double empty) {
    // pump = 0.5 fl oz

    double percentage = newSyrupThree / size;

    this.empty = empty / size;
    emptyDisplayLarge = 127 * this.empty;
    largeCup.empty = ((1600 * this.empty).roundToDouble()) / 100;
    smallCup.empty = ((800 * this.empty).roundToDouble()) / 100;

    syrupThree = percentage;
    syrupThreeDisplayLarge = 127 * percentage;

    largeCup.syrupThreeFLoz = (16 * syrupThree).roundToDouble();
    smallCup.syrupThreeFLoz = (8 * syrupThree).roundToDouble();

    largeCup.updatePrice();
    smallCup.updatePrice();
  }

  void updateSyrupFour(double newSyrupFour, double size, double empty) {
    // pump = 0.5 fl oz

    double percentage = newSyrupFour / size;

    this.empty = empty / size;
    emptyDisplayLarge = 127 * this.empty;
    largeCup.empty = ((1600 * this.empty).roundToDouble()) / 100;
    smallCup.empty = ((800 * this.empty).roundToDouble()) / 100;

    syrupFour = percentage;
    syrupFourDisplayLarge = 127 * percentage;

    largeCup.syrupFourFLoz = (16 * syrupFour).roundToDouble();
    smallCup.syrupFourFLoz = (8 * syrupFour).roundToDouble();

    largeCup.updatePrice();
    smallCup.updatePrice();
  }

  void updateSyrupFive(double newSyrupFive, double size, double empty) {
    // pump = 0.5 fl oz

    double percentage = newSyrupFive / size;

    this.empty = empty / size;
    emptyDisplayLarge = 127 * this.empty;
    largeCup.empty = ((1600 * this.empty).roundToDouble()) / 100;
    smallCup.empty = ((800 * this.empty).roundToDouble()) / 100;

    syrupFive = percentage;
    syrupFiveDisplayLarge = 127 * percentage;

    largeCup.syrupFiveFLoz = (16 * syrupFive).roundToDouble();
    smallCup.syrupFiveFLoz = (8 * syrupFive).roundToDouble();

    largeCup.updatePrice();
    smallCup.updatePrice();
  }

  void updateSyrupSix(double newSyrupSix, double size, double empty) {
    // pump = 0.5 fl oz

    double percentage = newSyrupSix / size;

    this.empty = empty / size;
    emptyDisplayLarge = 127 * this.empty;
    largeCup.empty = ((1600 * this.empty).roundToDouble()) / 100;
    smallCup.empty = ((800 * this.empty).roundToDouble()) / 100;

    syrupSix = percentage;
    syrupSixDisplayLarge = 127 * percentage;

    largeCup.syrupSixFLoz = (16 * syrupSix).roundToDouble();
    smallCup.syrupSixFLoz = (8 * syrupSix).roundToDouble();

    largeCup.updatePrice();
    smallCup.updatePrice();
  }
}
