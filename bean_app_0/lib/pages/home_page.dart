import 'package:bean_app_0/components/cup.dart';
import "package:bean_app_0/pages/editCupPage.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';
import '../components/cupDisplay.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool standardExpand = false;
  bool favoriteExpand = false;
  bool recentExpand = false;

  void toggleStandardExpand() {
    setState(() {
      standardExpand = !standardExpand;
    });
  }

  void toggleRecentsExpand() {
    setState(() {
      recentExpand = !recentExpand;
    });
  }

  void toggleFavoritesExpand() {
    setState(() {
      favoriteExpand = !favoriteExpand;
    });
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final standardCoffeeStack = [
      Cup(
        heat: 80,
        espresso: 0.2,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 0.1,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.3,
        milkFoam: 0.3,
        empty: 0.1,
        title: "Orange Mocha Frappucino",
        description:
            "Is there anything more to life than being really really really ridiculously good looking? You know what can help you sort through this important issue? ORANGE MOCHA FRAPPUCINO!!!",
      ),
      Cup(
        heat: 80,
        espresso: 0.2,
        hotWater: 0.2,
        syrupOne: 0.0,
        syrupTwo: 0.2,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 0.3,
        empty: 0.1,
        title: "Pinkidy Dinkidy",
      ),
      Cup(
        heat: 80,
        espresso: 0.0,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 0.0,
        empty: 0.1,
        title: "3",
      ),
      Cup(
        heat: 80,
        espresso: 0.0,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 0.0,
        empty: 0.1,
        title: "4",
      ),
      Cup(
        heat: 80,
        espresso: 0.0,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 0.0,
        empty: 0.1,
        title: "5",
      ),
      Cup(
        heat: 80,
        espresso: 0.0,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 0.0,
        empty: 0.1,
        title: "6",
      ),
      Cup(
        heat: 80,
        espresso: 0.0,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 0.0,
        empty: 0.1,
        title: "7",
      ),
    ];
    final recentCoffeeStack = [
      Cup(
        heat: 80,
        espresso: 0.2,
        hotWater: 0.2,
        syrupOne: 0.0,
        syrupTwo: 0.2,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 0.3,
        empty: 0.1,
        title: "Pinkidy Dinkidy",
      ),
      Cup(
        heat: 80,
        espresso: 0.2,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 0.1,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.3,
        milkFoam: 0.3,
        empty: 0.1,
        title: "Orange Mocha Frappucino",
        description:
            "Is there anything more to life than being really really really ridiculously good looking? You know what can help you sort through this important issue? ORANGE MOCHA FRAPPUCINO!!!",
      ),
      Cup(
        heat: 80,
        espresso: 0.0,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 0.0,
        empty: 0.1,
        title: "3",
      ),
      Cup(
        heat: 80,
        espresso: 0.0,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 0.0,
        empty: 0.1,
        title: "4",
      ),
      Cup(
        heat: 80,
        espresso: 0.0,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 0.0,
        empty: 0.1,
        title: "5",
      ),
      Cup(
        heat: 80,
        espresso: 0.0,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 0.0,
        empty: 0.1,
        title: "6",
      ),
      Cup(
        heat: 80,
        espresso: 0.0,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 0.0,
        empty: 0.1,
        title: "7",
      ),
    ];
    final favoritesCoffeeStack = [
      Cup(
        heat: 80,
        espresso: 0.2,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 0.1,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.3,
        milkFoam: 0.3,
        empty: 0.1,
        title: "Orange Mocha Frappucino",
        description:
            "Is there anything more to life than being really really really ridiculously good looking? You know what can help you sort through this important issue? ORANGE MOCHA FRAPPUCINO!!!",
      ),
      Cup(
        heat: 80,
        espresso: 0.2,
        hotWater: 0.2,
        syrupOne: 0.0,
        syrupTwo: 0.2,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 0.3,
        empty: 0.1,
        title: "Pinkidy Dinkidy",
      ),
      Cup(
        heat: 80,
        espresso: 0.0,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 0.0,
        empty: 0.1,
        title: "3",
      ),
      Cup(
        heat: 80,
        espresso: 0.0,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 0.0,
        empty: 0.1,
        title: "4",
      ),
      Cup(
        heat: 80,
        espresso: 0.0,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 0.0,
        empty: 0.1,
        title: "5",
      ),
      Cup(
        heat: 80,
        espresso: 0.0,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 0.0,
        empty: 0.1,
        title: "6",
      ),
      Cup(
        heat: 80,
        espresso: 0.0,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 0.0,
        empty: 0.1,
        title: "7",
      )
    ];
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
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      body: (standardExpand == true)
          ? Column(
              children: [
                // Standard
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Standard",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      GestureDetector(
                        onTap: () {
                          toggleStandardExpand();
                        },
                        child: Text(
                          "shrink",
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: GridView.builder(
                        itemCount: standardCoffeeStack.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditCupPage(
                                            originalCup:
                                                favoritesCoffeeStack[index % 7],
                                          )),
                                );
                              },
                              child: CupDisplay(
                                  data: standardCoffeeStack[index % 7],
                                  size: 1));
                        })),
              ],
            )
          : (recentExpand == true)
              ? Column(
                  children: [
                    // Standard
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "Recent",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          GestureDetector(
                            onTap: () {
                              toggleRecentsExpand();
                            },
                            child: Text(
                              "shrink",
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: GridView.builder(
                            itemCount: recentCoffeeStack.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditCupPage(
                                                originalCup: recentCoffeeStack[
                                                    index % 7],
                                              )),
                                    );
                                  },
                                  child: CupDisplay(
                                    data: recentCoffeeStack[index % 7],
                                    size: 1,
                                  ));
                            })),
                  ],
                )
              : (favoriteExpand)
                  ? Column(
                      children: [
                        // Standard
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "Favorite",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              GestureDetector(
                                onTap: () {
                                  toggleFavoritesExpand();
                                },
                                child: Text(
                                  "shrink",
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: GridView.builder(
                                itemCount: favoritesCoffeeStack.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => EditCupPage(
                                                    originalCup:
                                                        favoritesCoffeeStack[
                                                            index % 7],
                                                  )),
                                        );
                                      },
                                      child: CupDisplay(
                                        data: favoritesCoffeeStack[index % 7],
                                        size: 1,
                                      ));
                                })),
                      ],
                    )
                  : Column(
                      children: [
                        // Standard
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "Standard",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              GestureDetector(
                                onTap: () {
                                  toggleStandardExpand();
                                },
                                child: Text(
                                  "expand",
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListWheelScrollViewX.useDelegate(
                            scrollDirection: Axis.horizontal,
                            itemExtent: 200,
                            childDelegate: ListWheelChildBuilderDelegate(
                              builder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => EditCupPage(
                                                  originalCup:
                                                      standardCoffeeStack[
                                                          index % 7],
                                                )),
                                      );
                                    },
                                    child: CupDisplay(
                                        data: standardCoffeeStack[index % 7],
                                        size: 1));
                              },
                            ),
                            // specify the height or width of each item based on the scroll direction,
                            // scrollDirection: Axis.horizontal,
                          ),
                        ),

                        // Recomended
                        Divider(
                          thickness: 4,
                          color: Colors.grey[600],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "Recent",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              GestureDetector(
                                onTap: () {
                                  toggleRecentsExpand();
                                },
                                child: Text(
                                  "expand",
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListWheelScrollViewX.useDelegate(
                              scrollDirection: Axis.horizontal,
                              childDelegate: ListWheelChildBuilderDelegate(
                                builder: (context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => EditCupPage(
                                                    originalCup:
                                                        recentCoffeeStack[
                                                            index % 7],
                                                  )),
                                        );
                                      },
                                      child: CupDisplay(
                                          data: recentCoffeeStack[index % 7],
                                          size: 1));
                                },
                              ),
                              itemExtent:
                                  200 // specify the height or width of each item based on the scroll direction,
                              // scrollDirection: Axis.horizontal,
                              ),
                        ),

                        // Custom
                        Divider(
                          thickness: 4,
                          color: Colors.grey[600],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "Favorites",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              GestureDetector(
                                onTap: () {
                                  toggleFavoritesExpand();
                                },
                                child: Text(
                                  "expand",
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListWheelScrollViewX.useDelegate(
                              scrollDirection: Axis.horizontal,
                              childDelegate: ListWheelChildBuilderDelegate(
                                builder: (context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => EditCupPage(
                                                  originalCup:
                                                      favoritesCoffeeStack[
                                                          index % 7])),
                                        );
                                      },
                                      child: CupDisplay(
                                          data: favoritesCoffeeStack[index % 7],
                                          size: 1));
                                },
                              ),
                              itemExtent:
                                  200 // specify the height or width of each item based on the scroll direction,
                              // scrollDirection: Axis.horizontal,
                              ),
                        ),
                      ],
                    ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: const Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  "Locations",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
                title: Text(
                  "How to",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.help_outline,
                  color: Colors.white,
                ),
                title: Text(
                  "Help",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.grey[900],
      ),
    );
  }
}
