import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';
import "../components/cup.dart";

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

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final standardCoffeeStack = [
      const Cup(
        espresso: 45.0,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 15.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 35.0,
        milkFoam: 45.0,
        empty: 0.0,
        title: "Orange Mocha Frapacino",
      ),
      const Cup(
        espresso: 35.0,
        hotWater: 35.0,
        syrupOne: 0.0,
        syrupTwo: 25.0,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 45.0,
        empty: 0.0,
        title: "Pinkidy Dinkidy",
      ),
      const Cup(
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
        empty: 1.0,
        title: "3",
      ),
      const Cup(
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
        empty: 1.0,
        title: "4",
      ),
      const Cup(
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
        empty: 1.0,
        title: "5",
      ),
      const Cup(
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
        empty: 1.0,
        title: "6",
      ),
      const Cup(
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
        empty: 1.0,
        title: "7",
      ),
    ];
    final recentCoffeeStack = [
      const Cup(
        espresso: 35.0,
        hotWater: 35.0,
        syrupOne: 0.0,
        syrupTwo: 25.0,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 45.0,
        empty: 0.0,
        title: "Pinkidy Dinkidy",
      ),
      const Cup(
        espresso: 45.0,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 15.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 35.0,
        milkFoam: 45.0,
        empty: 0.0,
        title: "Orange Mocha Frapacino",
      ),
      const Cup(
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
        empty: 1.0,
        title: "3",
      ),
      const Cup(
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
        empty: 1.0,
        title: "4",
      ),
      const Cup(
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
        empty: 1.0,
        title: "5",
      ),
      const Cup(
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
        empty: 1.0,
        title: "6",
      ),
      const Cup(
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
        empty: 1.0,
        title: "7",
      ),
    ];
    final favoritesCoffeeStack = [
      const Cup(
        espresso: 45.0,
        hotWater: 0.0,
        syrupOne: 0.0,
        syrupTwo: 0.0,
        syrupThree: 15.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 35.0,
        milkFoam: 45.0,
        empty: 0.0,
        title: "Orange Mocha Frapacino",
      ),
      const Cup(
        espresso: 35.0,
        hotWater: 35.0,
        syrupOne: 0.0,
        syrupTwo: 25.0,
        syrupThree: 0.0,
        syrupFour: 0.0,
        syrupFive: 0.0,
        syrupSix: 0.0,
        steamedMilk: 0.0,
        milkFoam: 45.0,
        empty: 0.0,
        title: "Pinkidy Dinkidy",
      ),
      const Cup(
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
          empty: 1.0,
          title: "3"),
      const Cup(
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
          empty: 1.0,
          title: "4"),
      const Cup(
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
          empty: 1.0,
          title: "5"),
      const Cup(
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
          empty: 1.0,
          title: "6"),
      const Cup(
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
          empty: 1.0,
          title: "7")
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        // actions: <Widget>[
        //   Builder(builder: (context) {
        //     return IconButton(
        //         onPressed: () {
        //           Scaffold.of(context).openEndDrawer();
        //         },
        //         icon: const Icon(
        //           Icons.shopping_cart,
        //           color: Colors.white,
        //         ));
        //   }),
        // ],
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
                        "Test",
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
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  // child: GridView.builder(
                  // gridDelegate: SilverGridDelegateWithFixedCrossAxisCount, itemBuilder: itemBuilder)

                  child: ListWheelScrollViewX.useDelegate(
                    scrollDirection: Axis.horizontal,
                    itemExtent: 200,
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return standardCoffeeStack[index % 7];
                      },
                    ),
                    // specify the height or width of each item based on the scroll direction,
                    // scrollDirection: Axis.horizontal,
                  ),
                ),
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
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 16),
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
                        return standardCoffeeStack[index % 7];
                      },
                    ),
                    // specify the height or width of each item based on the scroll direction,
                    // scrollDirection: Axis.horizontal,
                  ),
                ),

                // Recomended
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
                      Text(
                        "expand",
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListWheelScrollViewX.useDelegate(
                      scrollDirection: Axis.horizontal,
                      childDelegate: ListWheelChildBuilderDelegate(
                        builder: (context, index) {
                          return recentCoffeeStack[index % 7];
                        },
                      ),
                      itemExtent:
                          200 // specify the height or width of each item based on the scroll direction,
                      // scrollDirection: Axis.horizontal,
                      ),
                ),

                // Custom
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
                      Text(
                        "expand",
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListWheelScrollViewX.useDelegate(
                      scrollDirection: Axis.horizontal,
                      childDelegate: ListWheelChildBuilderDelegate(
                        builder: (context, index) {
                          return favoritesCoffeeStack[index % 7];
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
