class CupData {
  double price = 0;
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
  double empty;

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
    required this.empty,
  }) {
    updatePrice();
  }

  void updatePrice() {
    this.price = ((this.espresso * 40) +
            (this.hotWaterFLoz * 4) +
            (this.syrupOneFLoz * 80) +
            (this.syrupTwoFLoz * 80) +
            (this.syrupThreeFLoz * 80) +
            (this.syrupFourFLoz * 80) +
            (this.syrupFiveFLoz * 80) +
            (this.syrupSixFLoz * 80) +
            (this.steamedMilkFLoz * 24) +
            (this.milkFoamFLoz * 20) +
            25)
        .roundToDouble();
  }

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
      empty: empty,
    );
  }
}
