import 'package:bean_app_0/components/cup.dart';
import 'package:bean_app_0/components/itemGrid.dart';
import 'package:bean_app_0/components/itemRow.dart';
import 'package:bean_app_0/pages/tempDataBase.dart';
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final box = Hive.box("tempBox");
  TempDataBase data = TempDataBase();
  bool standardExpand = false;
  bool favoriteExpand = false;
  bool recentExpand = false;

  @override
  void initState() {
    print("\n\n\n\n\test initState\n\n\n\n");
    print(box.get("tempData") == null);
    // If this is the first time the app has been opened start with the demo data.
    if (box.get("tempData") == null) {
      data.createInitialData();
    }
    // If not then load the data from the database
    else {
      data.load();
    }
    super.initState();
  }

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
          ? ItemGrid(
              title: "Standard",
              toggleExpand: toggleStandardExpand,
              stack: data.tempList.standardCoffeeStack)
          : (recentExpand == true)
              ? ItemGrid(
                  title: "Recent",
                  toggleExpand: toggleRecentsExpand,
                  stack: data.tempList.recentCoffeeStack)
              : (favoriteExpand)
                  ? ItemGrid(
                      title: "Favorites",
                      toggleExpand: toggleFavoritesExpand,
                      stack: data.tempList.favoritesCoffeeStack)
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
                        ItemRow(stack: data.tempList.standardCoffeeStack),

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
                        ItemRow(stack: data.tempList.recentCoffeeStack),
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
                        ItemRow(stack: data.tempList.favoritesCoffeeStack),
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
