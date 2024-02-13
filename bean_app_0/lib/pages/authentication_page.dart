// import 'package:firebase_core/firebase_core.dart';
import 'package:bean_app_0/pages/home_page.dart';
import 'package:bean_app_0/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_or_signup_page.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (constext, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginOrSignupPage();
        }
      },
    ));
  }
}
