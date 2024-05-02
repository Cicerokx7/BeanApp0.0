// import "dart:ffi";

import 'package:bean_app_0/components/cup.dart';
import 'package:bean_app_0/components/cupData.dart';
import 'package:bean_app_0/components/ingredientSlider.dart';
import "package:bean_app_0/pages/home_page.dart";
import "package:flutter/material.dart";
import '../components/cupDisplay.dart';
import "../components/login_button_A.dart";

class EditCupPage extends StatefulWidget {
  Cup originalCup;
  Cup cup;
  EditCupPage({
    Key? key,
    required this.originalCup,
    // this.cup = originalCup.copy()
  })
  @override
  State<EditCupPage> createState() => _EditCupState();
}

class _EditCupState extends State<EditCupPage> {
  // late Cup cup;
  late CupData ingredients;
  bool update = false;
  late double espressoVal = ingredients.espresso.toDouble();
  late double milkFoamVal = ingredients.milkFoamFLoz.toDouble();
  late double steamedMilkVal = ingredients.steamedMilkFLoz.toDouble();
  late double hotWaterVal = ingredients.hotWaterFLoz.toDouble();
  late double syrupOneVal = ingredients.syrupOneFLoz.toDouble();
  late double syrupTwoVal = ingredients.syrupTwoFLoz.toDouble();
  late double syrupThreeVal = ingredients.syrupThreeFLoz.toDouble();
  late double syrupFourVal = ingredients.syrupFourFLoz.toDouble();
  late double syrupFiveVal = ingredients.syrupFiveFLoz.toDouble();
  late double syrupSixVal = ingredients.syrupSixFLoz.toDouble();

  void initialize() {
    if (widget.cup.size == 0) {
      ingredients = widget.cup.smallCup;
    }
    if (widget.cup.size == 2) {
      ingredients = widget.cup.largeCup;
    }
  }

  void makeSmall() {
    setState(() {
      widget.cup.size = 0;
      print(espressoVal);
      test();
      print(ingredients.espresso);
      ingredients = widget.cup.smallCup;
      updateIngredients();
      update = true;
    });
  }

  void makeLarge() {
    setState(() {
      widget.cup.size = 2;
      // ingredients = cup.largeCup;
      // // updateIngredients();
      // print(ingredients.espresso);
    });
  }

  void updateIngredients() {
    espressoVal = ingredients.espresso.toDouble() / 100;
    milkFoamVal = ingredients.milkFoamFLoz.toDouble() / 100;
    steamedMilkVal = ingredients.steamedMilkFLoz.toDouble() / 100;
    hotWaterVal = ingredients.hotWaterFLoz.toDouble() / 100;
    syrupOneVal = ingredients.syrupOneFLoz.toDouble() / 100;
    syrupTwoVal = ingredients.syrupTwoFLoz.toDouble() / 100;
    syrupThreeVal = ingredients.syrupThreeFLoz.toDouble() / 100;
    syrupFourVal = ingredients.syrupFourFLoz.toDouble() / 100;
    syrupFiveVal = ingredients.syrupFiveFLoz.toDouble() / 100;
    syrupSixVal = ingredients.syrupSixFLoz.toDouble() / 100;
  }

  void test() {
    setState(() {
      // ingredients.espresso = espressoVal;
      widget.cup.smallCup.test(espressoVal);
      ingredients.milkFoamFLoz = milkFoamVal;
      ingredients.steamedMilkFLoz = steamedMilkVal;
      ingredients.hotWaterFLoz = hotWaterVal;
      ingredients.syrupOneFLoz = syrupOneVal;
      ingredients.syrupTwoFLoz = syrupTwoVal;
      ingredients.syrupThreeFLoz = syrupThreeVal;
      ingredients.syrupFourFLoz = syrupFourVal;
      ingredients.syrupFiveFLoz = syrupFiveVal;
      ingredients.syrupSixFLoz = syrupSixVal;
    });
  }

  double sliderVal = 0.0;
  @override
  Widget build(BuildContext context) {
    initialize();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: <Widget>[
          Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ));
          }),
        ],
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          );
        }),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              CupDisplay(
                data: widget.cup,
                size: 2,
              ),
              Visibility(
                visible: widget.cup.description != null,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    widget.cup.description != null
                        ? widget.cup.description!
                        : '',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              LoginButtonA(
                text: "Add to Cart",
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Small",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Checkbox(
                      value: widget.cup.size == 0,
                      onChanged: (value) {
                        makeSmall();
                      },
                      shape: const CircleBorder(),
                      checkColor: Color.fromRGBO(184, 148, 7, 1),
                      activeColor: Color.fromRGBO(184, 148, 7, 1),
                      side: const BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    const Text(
                      "Large",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Checkbox(
                      value: widget.cup.size == 2,
                      onChanged: (value) {
                        makeLarge();
                      },
                      shape: const CircleBorder(),
                      checkColor: Color.fromRGBO(184, 148, 7, 1),
                      activeColor: Color.fromRGBO(184, 148, 7, 1),
                      side: const BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                  ],
                ),
              ),
              IngredientSlider(
                min: 0,
                max: ingredients.size,
                divisions: ingredients.size,
                title: "Espresso",
                startVal: ingredients.espresso,
                sliderVal: espressoVal,
                update: update,
              ),
              IngredientSlider(
                min: 0,
                max: ingredients.size,
                divisions: ingredients.size,
                title: "Milk Foam",
                startVal: ingredients.milkFoamFLoz,
                sliderVal: milkFoamVal,
                update: update,
              ),
              IngredientSlider(
                min: 0,
                max: ingredients.size,
                divisions: ingredients.size,
                title: "Steamed Milk",
                startVal: ingredients.steamedMilkFLoz,
                sliderVal: steamedMilkVal,
                update: update,
              ),
              IngredientSlider(
                min: 0,
                max: ingredients.size,
                divisions: ingredients.size,
                title: "Hot Water",
                startVal: ingredients.hotWaterFLoz,
                sliderVal: hotWaterVal,
                update: update,
              ),
              IngredientSlider(
                min: 0,
                max: ingredients.size,
                divisions: ingredients.size,
                title: "Syrup 1",
                startVal: ingredients.syrupOneFLoz,
                sliderVal: syrupOneVal,
                update: update,
              ),
              IngredientSlider(
                min: 0,
                max: ingredients.size,
                divisions: ingredients.size,
                title: "Syrup 2",
                startVal: ingredients.syrupTwoFLoz,
                sliderVal: syrupTwoVal,
                update: update,
              ),
              IngredientSlider(
                min: 0,
                max: ingredients.size,
                divisions: ingredients.size,
                title: "Syrup 3",
                startVal: ingredients.syrupThreeFLoz,
                sliderVal: syrupThreeVal,
                update: update,
              ),
              IngredientSlider(
                min: 0,
                max: ingredients.size,
                divisions: ingredients.size,
                title: "Syrup 4",
                startVal: ingredients.syrupFourFLoz,
                sliderVal: syrupFiveVal,
                update: update,
              ),
              IngredientSlider(
                min: 0,
                max: ingredients.size,
                divisions: ingredients.size,
                title: "Syrup 5",
                startVal: ingredients.syrupFiveFLoz,
                sliderVal: syrupFiveVal,
                update: update,
              ),
              IngredientSlider(
                min: 0,
                max: ingredients.size,
                divisions: ingredients.size,
                title: "Syrup 6",
                startVal: ingredients.syrupSixFLoz,
                sliderVal: syrupSixVal,
                update: update,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
