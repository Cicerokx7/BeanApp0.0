import 'package:bean_app_0/pages/Thome_page.dart';
import 'package:bean_app_0/pages/authentication_page.dart';
import 'package:bean_app_0/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'data/data.dart';
import 'pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  //Retrieve the phone's database
  var box = await Hive.openBox("tempBox");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthenticationPage(),
    );
  }
}
