import 'dart:io';

import 'package:bean_app_0/components/login_tile.dart';
import 'package:bean_app_0/components/my_textfield.dart';
import 'package:bean_app_0/components/login_button_A.dart';
import 'package:bean_app_0/components/login_button_B.dart';
import 'package:bean_app_0/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//221, 190, 86, 1
  final emailController = TextEditingController();
  final passWordController = TextEditingController();

  void login() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color.fromRGBO(184, 148, 7, 1),
            ),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passWordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        // print("Invalid Email or Password");
        signInError();
      }
    }

    // Navigator.pop(context);
  }

  void signInError() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Incorrect Password or Email'),
          );
        });
  }

  void signinApple() {}

  // void signup() {}

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        //#d6a606
        backgroundColor: Colors.black,
        // ignore: prefer_const_constructors
        body: SafeArea(
          // ignore: prefer_const_constructors
          child: Center(
            // ignore: prefer_const_constructors
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    //Logo
                    // const Icon(
                    //   Icons.coffeeBotLogo,
                    //   size: 100,
                    // )
                    // ignore: prefer_const_constructors
                    Text("CoffeeBot",
                        style: const TextStyle(
                          color: Color.fromRGBO(184, 148, 7, 1),
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        )),

                    const SizedBox(height: 50),

                    //welcom back
                    Text("Welcome Back",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16,
                        )),

                    const SizedBox(height: 25),
                    //username textfield
                    // ignore: prefer_const_constructors
                    MyTextField(
                        controller: emailController,
                        hintText: "Email",
                        obscureText: false),
                    const SizedBox(height: 25),
                    //password textfield
                    MyTextField(
                        controller: passWordController,
                        hintText: "Password",
                        obscureText: true),

                    const SizedBox(height: 10),
                    //forgot password?
                    Text("Forgot Password?",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16,
                        )),

                    const SizedBox(height: 10),
                    // sign in button
                    LoginButtonA(onTap: login, text: "Sign In"),

                    const SizedBox(height: 10),
                    //sign up
                    LoginButtonB(onTap: widget.onTap, text: "Sign Up"),

                    const SizedBox(height: 30),
                    //or continue with:
                    Row(
                      children: [
                        Expanded(
                            child:
                                Divider(color: Colors.grey[500], thickness: 3)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("Or Sign In Using",
                              style: TextStyle(
                                  color: Color.fromRGBO(
                                    184,
                                    148,
                                    7,
                                    1,
                                  ),
                                  fontSize: 20)),
                        ),
                        Expanded(
                            child:
                                Divider(color: Colors.grey[500], thickness: 3))
                      ],
                    ),
                    //google/apple
                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoginTile(
                            onTap: () {}, imagePath: 'lib/images/apple.png'),
                        const SizedBox(width: 30),
                        LoginTile(
                            onTap: () =>
                                AuthenticationService().signInWithGoogle(),
                            imagePath: 'lib/images/google.png')
                      ],
                    )
                    //sign up
                  ]),
            ),
          ),
        ));
  }
}
