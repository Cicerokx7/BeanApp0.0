import 'package:bean_app_0/components/cup.dart';
import 'package:bean_app_0/components/cupData.dart';
import 'package:bean_app_0/components/ingredientSliderDouble.dart';
import "package:bean_app_0/pages/home_page.dart";
import "package:flutter/material.dart";
import '../components/cupDisplay.dart';
import '../components/ingredientSlider.dart';
import "../components/login_button_A.dart";

// ignore: must_be_immutable
class EditCupPage extends StatefulWidget {
  Cup originalCup;
  EditCupPage({
    super.key,
    required this.originalCup,
  });
  @override
  State<EditCupPage> createState() => _EditCupState();
}

class _EditCupState extends State<EditCupPage> {
  late Cup cup = widget.originalCup.copy();
  late CupData ingredients = cup.largeCup;
  final titleController = TextEditingController();
  final descritionController = TextEditingController();
  bool update = false;

  void initialize() {
    if (cup.size == 0) {
      ingredients = cup.smallCup;
    }
    if (cup.size == 2) {
      ingredients = cup.largeCup;
    }
  }

  void changeSize() {
    setState(() {
      if (cup.size == 0) {
        cup.size = 2;
        update = true;
      } else if (cup.size == 2) {
        cup.size = 0;
        update = true;
      }
    });
  }

  // void editDetails() {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return EditBox(
  //           titleController,
  //           descritionController,
  //         );
  //       });
  // }

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
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          );
        }),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              GestureDetector(
                onLongPress: () {},
                child: CupDisplay(
                  data: cup,
                  size: 2,
                ),
              ),
              Visibility(
                visible: cup.description != null,
                child: GestureDetector(
                  onLongPress: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      cup.description != null ? cup.description! : '',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              // Row(children: [],),
              Text(
                "\$${ingredients.price / 100}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
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
                      value: cup.size == 0,
                      onChanged: (value) {
                        changeSize();
                      },
                      shape: const CircleBorder(),
                      checkColor: const Color.fromRGBO(184, 148, 7, 1),
                      activeColor: const Color.fromRGBO(184, 148, 7, 1),
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
                      value: cup.size == 2,
                      onChanged: (value) {
                        changeSize();
                      },
                      shape: const CircleBorder(),
                      checkColor: const Color.fromRGBO(184, 148, 7, 1),
                      activeColor: const Color.fromRGBO(184, 148, 7, 1),
                      side: const BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                  ],
                ),
              ),
              IngredientSlider(
                min: 60,
                max: 100,
                divisions: 40,
                title: "Temperature",
                units: " F",
                startVal: cup.heat,
                onChanged: (value) {
                  setState(() {
                    cup.heat = value;
                    // build(context);
                  });
                },
                update: update,
              ),
              IngredientSlider(
                min: 0,
                max: ingredients.empty + ingredients.espresso,
                divisions: ingredients.empty + ingredients.espresso,
                title: "Espresso",
                units: " Shots",
                startVal: ingredients.espresso,
                onChanged: (value) {
                  setState(() {
                    ingredients.empty =
                        ingredients.empty + ingredients.espresso - value;
                    if (ingredients.empty < 0) {
                      ingredients.empty = 0;
                    }
                    cup.updateEspresso(
                        value, ingredients.size, ingredients.empty);
                    // build(context);
                  });
                },
                update: update,
                // limit: 5,
              ),
              IngredientSliderDouble(
                min: 0,
                max: ingredients.milkFoamFLoz + ingredients.empty,
                divisions: ingredients.milkFoamFLoz + ingredients.empty,
                title: "Milk Foam",
                units: " fL oz",
                startVal: ingredients.milkFoamFLoz,
                // sliderVal: milkFoamVal,
                onChanged: (value) {
                  setState(() {
                    ingredients.empty =
                        ingredients.empty + ingredients.milkFoamFLoz - value;
                    if (ingredients.empty < 0) {
                      ingredients.empty = 0;
                    }
                    ingredients.milkFoamFLoz = value;
                    cup.updateMilkFoam(ingredients.milkFoamFLoz,
                        ingredients.size, ingredients.empty);
                  });
                },
                update: update,
              ),
              IngredientSliderDouble(
                min: 0,
                max: ingredients.steamedMilkFLoz + ingredients.empty,
                divisions: ingredients.steamedMilkFLoz + ingredients.empty,
                title: "Steamed Milk",
                units: " fL oz",
                startVal: ingredients.steamedMilkFLoz,
                onChanged: (value) {
                  setState(() {
                    ingredients.empty =
                        ingredients.empty + ingredients.steamedMilkFLoz - value;
                    if (ingredients.empty < 0) {
                      ingredients.empty = 0;
                    }
                    ingredients.steamedMilkFLoz = value;
                    cup.updateSteamedMilk(ingredients.steamedMilkFLoz,
                        ingredients.size, ingredients.empty);
                    // build(context);
                  });
                },
                update: update,
              ),
              IngredientSliderDouble(
                min: 0,
                max: ingredients.hotWaterFLoz + ingredients.empty,
                divisions: ingredients.hotWaterFLoz + ingredients.empty,
                title: "Hot Water",
                units: " fL oz",
                startVal: ingredients.hotWaterFLoz,
                onChanged: (value) {
                  setState(() {
                    ingredients.empty =
                        ingredients.empty + ingredients.hotWaterFLoz - value;
                    if (ingredients.empty < 0) {
                      ingredients.empty = 0;
                    }
                    cup.updateHotWater(
                        value, ingredients.size, ingredients.empty);
                  });
                },
                update: update,
              ),
              IngredientSlider(
                min: 0,
                max: ingredients.syrupOneFLoz + ingredients.empty,
                divisions: ingredients.syrupOneFLoz + ingredients.empty,
                title: "Syrup 1",
                units: " Pumps",
                startVal: ingredients.syrupOneFLoz,
                onChanged: (value) {
                  setState(() {
                    ingredients.empty =
                        ingredients.empty + ingredients.syrupOneFLoz - value;
                    if (ingredients.empty < 0) {
                      ingredients.empty = 0;
                    }
                    cup.updateSyrupOne(
                        value, ingredients.size, ingredients.empty);
                  });
                },
                update: update,
              ),
              IngredientSlider(
                min: 0,
                max: ingredients.syrupTwoFLoz + ingredients.empty,
                divisions: ingredients.syrupTwoFLoz + ingredients.empty,
                title: "Syrup 2",
                units: " Pumps",
                startVal: ingredients.syrupTwoFLoz,
                onChanged: (value) {
                  setState(() {
                    ingredients.empty =
                        ingredients.empty + ingredients.syrupTwoFLoz - value;
                    if (ingredients.empty < 0) {
                      ingredients.empty = 0;
                    }
                    cup.updateSyrupTwo(
                        value, ingredients.size, ingredients.empty);
                  });
                },
                update: update,
              ),
              IngredientSlider(
                min: 0,
                max: ingredients.syrupThreeFLoz + ingredients.empty,
                divisions: ingredients.syrupThreeFLoz + ingredients.empty,
                title: "Syrup 3",
                units: " Pumps",
                startVal: ingredients.syrupThreeFLoz,
                onChanged: (value) {
                  setState(() {
                    ingredients.empty =
                        ingredients.empty + ingredients.syrupThreeFLoz - value;
                    if (ingredients.empty < 0) {
                      ingredients.empty = 0;
                    }
                    cup.updateSyrupThree(
                        value, ingredients.size, ingredients.empty);
                  });
                },
                update: update,
              ),
              IngredientSlider(
                min: 0,
                max: ingredients.syrupFourFLoz + ingredients.empty,
                divisions: ingredients.syrupFourFLoz + ingredients.empty,
                title: "Syrup 4",
                units: " Pumps",
                startVal: ingredients.syrupFourFLoz,
                onChanged: (value) {
                  setState(() {
                    ingredients.empty =
                        ingredients.empty + ingredients.syrupFourFLoz - value;
                    if (ingredients.empty < 0) {
                      ingredients.empty = 0;
                    }
                    cup.updateSyrupFour(
                        value, ingredients.size, ingredients.empty);
                  });
                },
                update: update,
              ),
              IngredientSlider(
                min: 0,
                max: ingredients.syrupFiveFLoz + ingredients.empty,
                divisions: ingredients.syrupFiveFLoz + ingredients.empty,
                title: "Syrup 5",
                units: " Pumps",
                startVal: ingredients.syrupFiveFLoz,
                onChanged: (value) {
                  setState(() {
                    ingredients.empty =
                        ingredients.empty + ingredients.syrupFiveFLoz - value;
                    if (ingredients.empty < 0) {
                      ingredients.empty = 0;
                    }
                    cup.updateSyrupFive(
                        value, ingredients.size, ingredients.empty);
                  });
                },
                update: update,
              ),
              IngredientSlider(
                min: 0,
                max: ingredients.syrupSixFLoz + ingredients.empty,
                divisions: ingredients.syrupSixFLoz + ingredients.empty,
                title: "Syrup 6",
                units: " Pumps",
                startVal: ingredients.syrupSixFLoz,
                onChanged: (value) {
                  setState(() {
                    ingredients.empty =
                        ingredients.empty + ingredients.syrupSixFLoz - value;
                    if (ingredients.empty < 0) {
                      ingredients.empty = 0;
                    }
                    cup.updateEspresso(
                        value, ingredients.size, ingredients.empty);
                  });
                },
                update: update,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
