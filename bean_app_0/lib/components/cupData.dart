class CupData {
  double espresso;
  double hotWaterFLoz;
  double syrupOneFLoz;
  double syrupTwoFLoz;
  double syrupThreeFLoz;
  double syrupFourFLoz;
  double syrupFiveFLoz;
  double syrupSixFLoz;
  double steamedMilkFLoz;
  double milkFoamFLoz;
  double size;

  CupData({
    required this.espresso,
    required this.hotWaterFLoz,
    required this.syrupOneFLoz,
    required this.syrupTwoFLoz,
    required this.syrupThreeFLoz,
    required this.syrupFourFLoz,
    required this.syrupFiveFLoz,
    required this.syrupSixFLoz,
    required this.steamedMilkFLoz,
    required this.milkFoamFLoz,
    required this.size,
  });

  CupData copy() {
    return CupData(
      espresso: espresso,
      hotWaterFLoz: hotWaterFLoz,
      syrupOneFLoz: syrupOneFLoz,
      syrupTwoFLoz: syrupTwoFLoz,
      syrupThreeFLoz: syrupThreeFLoz,
      syrupFourFLoz: syrupFourFLoz,
      syrupFiveFLoz: syrupFiveFLoz,
      syrupSixFLoz: syrupSixFLoz,
      steamedMilkFLoz: steamedMilkFLoz,
      milkFoamFLoz: milkFoamFLoz,
      size: size,
    );
  }

  void test(double val) {
    espresso = val;
    print(val);
    print(espresso);
  }
}
