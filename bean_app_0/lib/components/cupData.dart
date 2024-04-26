class CupData {
  final String title;
  final String? description;
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

  CupData({
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
    required this.empty,
  });
}
