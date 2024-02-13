import 'package:bean_app_0/pages/login_page.dart';
import 'package:bean_app_0/pages/signup_page.dart';
import 'package:flutter/material.dart';

class LoginOrSignupPage extends StatefulWidget {
  const LoginOrSignupPage({super.key});

  @override
  State<LoginOrSignupPage> createState() => _LoginOrSignUpPageState();
}

class _LoginOrSignUpPageState extends State<LoginOrSignupPage> {
  // Initially showLoginPage
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return SignupPage(
        onTap: togglePages,
      );
    }
  }
}
