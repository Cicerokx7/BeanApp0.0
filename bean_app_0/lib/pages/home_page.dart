import 'package:bean_app_0/components/cartDrawer.dart';
import 'package:bean_app_0/components/cup.dart';
import 'package:bean_app_0/components/itemGrid.dart';
import 'package:bean_app_0/components/itemRow.dart';
import 'package:bean_app_0/data/tempDataBase.dart';
import 'package:bean_app_0/services/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import 'package:hive_flutter/hive_flutter.dart';

import '../data/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final box = Hive.box('tempBox');
  // TempDataBase data = TempDataBase();
  final FirestoreService data = FirestoreService();
  bool standardExpand = false;
  bool favoriteExpand = false;
  bool recentExpand = false;

  @override
  void initState() {
    print("\n\n\n\n\test initState\n\n\n\n");
    // print(box.get("tempData") == null);
    // If this is the first time the app has been opened start with the demo data.
    // if (data.isEmpty()) {
    //   data.createInitialData();
    // }
    // If not then load the data from the database
    // else {
    //   data.load();
    // }
    data.createInitialData();
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
    return StreamBuilder<QuerySnapshot>(
      stream: data.getDataStream(),
      builder: (context, snapshot) {
        // Make sure to return a Widget in all cases
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('No data available'));
        }
        //Watch a different video to verify that this is right. This seems unecisarially complex.
        DocumentSnapshot document = snapshot.data!.docs[0];
        String docID = document.id;
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        List<Cup> dataList = data['recent'];

        // Your existing code to build the UI when data is available
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
                  stacki: 0,
                  box: data,
                )
              : (recentExpand == true)
                  ? ItemGrid(
                      title: "Recent",
                      toggleExpand: toggleRecentsExpand,
                      stacki: 1,
                      box: data,
                    )
                  : (favoriteExpand)
                      ? ItemGrid(
                          title: "Favorites",
                          toggleExpand: toggleFavoritesExpand,
                          stacki: 2,
                          box: data,
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
                            ItemRow(
                              stack: data.tempList[0],
                              box: data,
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
                            ItemRow(
                              stack: data.tempList[1],
                              box: data,
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
                            ItemRow(
                              stack: data.tempList[2],
                              box: data,
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
            child: cartDawer(
              box: data,
            ),
          ),
        );
      },
    );
  }
}
