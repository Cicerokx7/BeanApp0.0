import 'dart:io';

import 'package:bean_app_0/components/login_tile.dart';
import 'package:bean_app_0/components/my_textfield.dart';
import 'package:bean_app_0/components/login_button_A.dart';
import 'package:bean_app_0/components/login_button_B.dart';
import 'package:bean_app_0/pages/authentication_page.dart';
import 'package:bean_app_0/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  final Function()? onTap;
  SignupPage({super.key, required this.onTap});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
//221, 190, 86, 1
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void createAccount() async {
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
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        passwordMissMatch();
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        // print("Invalid Email or Password");
        signupError();
      }
    }

    // Navigator.pop(context);
  }

  void passwordMissMatch() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Passwords Do Not Match'),
          );
        });
  }

  void signupError() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Incorrect Password or Email'),
          );
        });
  }

  // void signup() {}
  void loginExistingAccount() {}

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
                    Text("Welcome",
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
                        controller: passwordController,
                        hintText: "Password",
                        obscureText: true),

                    const SizedBox(height: 25),
                    MyTextField(
                        controller: confirmPasswordController,
                        hintText: "Confirm Password",
                        obscureText: true),

                    // const SizedBox(height: 10),
                    // //forgot password?
                    // Text("Forgot Password?",
                    //     style: TextStyle(
                    //       color: Colors.grey[500],
                    //       fontSize: 16,
                    //     )),

                    const SizedBox(height: 10),
                    // sign in button
                    LoginButtonA(
                      onTap: createAccount,
                      text: "Create Account",
                    ),

                    const SizedBox(height: 10),
                    //sign up
                    LoginButtonB(
                      onTap: widget.onTap,
                      text: "Sign In With Existing Account",
                    ),

                    const SizedBox(height: 20),
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
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoginTile(
                            onTap: () {}, imagePath: 'lib/images/apple.png'),
                        SizedBox(width: 30),
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
