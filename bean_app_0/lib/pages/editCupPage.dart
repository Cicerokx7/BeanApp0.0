// import 'dart:ffi';

import 'package:bean_app_0/components/cup.dart';
import 'package:bean_app_0/components/cupData.dart';
import 'package:bean_app_0/components/ingredientSliderDouble.dart';
import 'package:bean_app_0/components/login_button_B.dart';
import 'package:bean_app_0/components/unusedIngredient.dart';
import "package:bean_app_0/pages/home_page.dart";
import "package:flutter/material.dart";
import '../components/cupDisplay.dart';
import '../components/ingredientSlider.dart';
import "../components/login_button_A.dart";

// ignore: must_be_immutable
class EditCupPage extends StatefulWidget {
  Cup originalCup;
  bool espressoUsed = false;
  bool hotwaterUsed = false;
  bool syrupOneUsed = false;
  bool syrupTwoUsed = false;
  bool syrupThreeUsed = false;
  bool syrupFourUsed = false;
  bool syrupFiveUsed = false;
  bool syrupSixUsed = false;
  bool steamedMilkUsed = false;
  bool milkFoamUsed = false;

  EditCupPage({
    super.key,
    required this.originalCup,
  }) {
    initialize();
  }

  void initialize() {
    if (originalCup.espresso > 0) {
      espressoUsed = true;
    }
    if (originalCup.hotWater > 0) {
      hotwaterUsed = true;
    }
    if (originalCup.syrupOne > 0) {
      syrupOneUsed = true;
    }
    if (originalCup.syrupTwo > 0) {
      syrupTwoUsed = true;
    }
    if (originalCup.syrupThree > 0) {
      syrupThreeUsed = true;
    }
    if (originalCup.syrupFour > 0) {
      syrupFourUsed = true;
    }
    if (originalCup.syrupFive > 0) {
      syrupFiveUsed = true;
    }
    if (originalCup.syrupSix > 0) {
      syrupSixUsed = true;
    }
    if (originalCup.steamedMilk > 0) {
      steamedMilkUsed = true;
    }
    if (originalCup.milkFoam > 0) {
      milkFoamUsed = true;
    }
  }

  @override
  State<EditCupPage> createState() => _EditCupState();
}

class _EditCupState extends State<EditCupPage> {
  late Cup cup = widget.originalCup.copy();
  late CupData ingredients = cup.largeCup;
  final titleController = TextEditingController();
  final descritionController = TextEditingController();
  bool update = false;
  bool menuExpand = false;

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

  void changeCaffeine() {
    setState(() {
      cup.caffeinated = !cup.caffeinated;
      update = true;
    });
  }

  void changeMilk() {
    setState(() {
      cup.wholeMilk = !cup.wholeMilk;
      update = true;
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
              Visibility(
                visible: widget.espressoUsed,
                child: IngredientSlider(
                  min: 0,
                  max: ((ingredients.espresso + ingredients.empty).toInt())
                      .toDouble(),
                  divisions:
                      ((ingredients.espresso + ingredients.empty).toInt())
                          .toDouble(),
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
              ),
              Visibility(
                visible: widget.espressoUsed,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Decaf",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Checkbox(
                        value: cup.caffeinated,
                        onChanged: (value) {
                          changeCaffeine();
                        },
                        shape: const CircleBorder(),
                        checkColor: const Color.fromRGBO(184, 148, 7, 1),
                        activeColor: const Color.fromRGBO(184, 148, 7, 1),
                        side: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      // const Text(
                      //   "Large",
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 20,
                      //   ),
                      // ),
                      // Checkbox(
                      //   value: cup.size == 2,
                      //   onChanged: (value) {
                      //     changeSize();
                      //   },
                      //   shape: const CircleBorder(),
                      //   checkColor: const Color.fromRGBO(184, 148, 7, 1),
                      //   activeColor: const Color.fromRGBO(184, 148, 7, 1),
                      //   side: const BorderSide(
                      //     color: Colors.grey,
                      //     width: 2,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: widget.milkFoamUsed,
                child: IngredientSliderDouble(
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
              ),
              Visibility(
                visible: widget.steamedMilkUsed,
                child: IngredientSliderDouble(
                  min: 0,
                  max: ingredients.steamedMilkFLoz + ingredients.empty,
                  divisions: ingredients.steamedMilkFLoz + ingredients.empty,
                  title: "Steamed Milk",
                  units: " fL oz",
                  startVal: ingredients.steamedMilkFLoz,
                  onChanged: (value) {
                    setState(() {
                      ingredients.empty = ingredients.empty +
                          ingredients.steamedMilkFLoz -
                          value;
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
              ),
              Visibility(
                visible: (widget.milkFoamUsed || widget.steamedMilkUsed),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Whole Milk",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Checkbox(
                        value: cup.wholeMilk,
                        onChanged: (value) {
                          changeMilk();
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
                        "Skim Milk",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Checkbox(
                        value: !cup.wholeMilk,
                        onChanged: (value) {
                          changeMilk();
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
              ),
              Visibility(
                visible: widget.hotwaterUsed,
                child: IngredientSliderDouble(
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
              ),
              Visibility(
                visible: widget.syrupOneUsed,
                child: IngredientSlider(
                  min: 0,
                  max: ((ingredients.syrupOneFLoz + ingredients.empty).toInt())
                      .toDouble(),
                  divisions:
                      ((ingredients.syrupOneFLoz + ingredients.empty).toInt())
                          .toDouble(),
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
                    print("");
                    print(value);
                    print(ingredients.empty);
                  },
                  update: update,
                ),
              ),
              Visibility(
                visible: widget.syrupTwoUsed,
                child: IngredientSlider(
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
              ),
              Visibility(
                visible: widget.syrupThreeUsed,
                child: IngredientSlider(
                  min: 0,
                  max:
                      ((ingredients.syrupThreeFLoz + ingredients.empty).toInt())
                          .toDouble(),
                  divisions:
                      ((ingredients.syrupThreeFLoz + ingredients.empty).toInt())
                          .toDouble(),
                  title: "Syrup 3",
                  units: " Pumps",
                  startVal: ingredients.syrupThreeFLoz,
                  onChanged: (value) {
                    setState(() {
                      ingredients.empty = ingredients.empty +
                          ingredients.syrupThreeFLoz -
                          value;
                      if (ingredients.empty < 0) {
                        ingredients.empty = 0;
                      }
                      cup.updateSyrupThree(
                          value, ingredients.size, ingredients.empty);
                    });
                  },
                  update: update,
                ),
              ),
              Visibility(
                visible: widget.syrupFourUsed,
                child: IngredientSlider(
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
              ),
              Visibility(
                visible: widget.syrupFiveUsed,
                child: IngredientSlider(
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
              ),
              Visibility(
                visible: widget.syrupSixUsed,
                child: IngredientSlider(
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
              ),
              Visibility(
                visible: this.menuExpand,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: Divider(color: Colors.grey[500], thickness: 3),
                  ),
                ),
              ),
              Visibility(
                visible: !this.menuExpand,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: LoginButtonA(
                    text: "Show All",
                    onTap: () {
                      setState(() {
                        this.menuExpand = true;
                      });
                    },
                  ),
                ),
              ),
              Visibility(
                visible: this.menuExpand,
                child: Column(
                  children: [
                    Visibility(
                      visible: !widget.espressoUsed,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: UnusedIngredient(
                            onTap: () {
                              setState(() {
                                widget.espressoUsed = true;
                              });
                            },
                            text: "Espresso"),
                      ),
                    ),
                    Visibility(
                      visible: !widget.milkFoamUsed,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: UnusedIngredient(
                            onTap: () {
                              setState(() {
                                widget.milkFoamUsed = true;
                              });
                            },
                            text: "Milk Foam"),
                      ),
                    ),
                    Visibility(
                      visible: !widget.steamedMilkUsed,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: UnusedIngredient(
                            onTap: () {
                              setState(() {
                                widget.steamedMilkUsed = true;
                              });
                            },
                            text: "Steamed Milk"),
                      ),
                    ),
                    Visibility(
                      visible: !widget.hotwaterUsed,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: UnusedIngredient(
                            onTap: () {
                              setState(() {
                                widget.hotwaterUsed = true;
                              });
                            },
                            text: "Hot Water"),
                      ),
                    ),
                    Visibility(
                      visible: !widget.syrupOneUsed,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: UnusedIngredient(
                            onTap: () {
                              setState(() {
                                widget.syrupOneUsed = true;
                              });
                            },
                            text: "Syrup One"),
                      ),
                    ),
                    Visibility(
                      visible: !widget.syrupTwoUsed,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: UnusedIngredient(
                            onTap: () {
                              setState(() {
                                widget.syrupTwoUsed = true;
                              });
                            },
                            text: "Syrup Two"),
                      ),
                    ),
                    Visibility(
                      visible: !widget.syrupThreeUsed,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: UnusedIngredient(
                            onTap: () {
                              setState(() {
                                widget.syrupThreeUsed = true;
                              });
                            },
                            text: "Syrup Three"),
                      ),
                    ),
                    Visibility(
                      visible: !widget.syrupFourUsed,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: UnusedIngredient(
                            onTap: () {
                              setState(() {
                                widget.syrupFourUsed = true;
                              });
                            },
                            text: "Syrup Four"),
                      ),
                    ),
                    Visibility(
                      visible: !widget.syrupFiveUsed,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: UnusedIngredient(
                            onTap: () {
                              setState(() {
                                widget.syrupFiveUsed = true;
                              });
                            },
                            text: "Syrup Five"),
                      ),
                    ),
                    Visibility(
                      visible: !widget.syrupSixUsed,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: UnusedIngredient(
                            onTap: () {
                              setState(() {
                                widget.syrupSixUsed = true;
                              });
                            },
                            text: "Syrup Six"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: LoginButtonB(
                        text: "Hide",
                        onTap: () {
                          setState(() {
                            this.menuExpand = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
