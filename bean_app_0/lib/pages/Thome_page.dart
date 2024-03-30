import 'package:bean_app_0/components/login_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class THomePage extends StatefulWidget {
  const THomePage({super.key});

  @override
  State<THomePage> createState() => _THomePageState();
}

class _THomePageState extends State<THomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  @override
  void initState() {
    super.initState();
    // _auth.authStateChanges().listen((event) {
    //   setState(() {
    //     _user = event;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _user != null ? _userInfo() : _googleSignInButton(),
    );

    // LoginTile(
    //     onTap: () => AuthenticationService().signInWithGoogle(),
    //     imagePath: 'lib/images/google.png'));
  }

  Widget _googleSignInButton() {
    return Center(
        child: LoginTile(
            onTap: _handleGoogleSignIn, imagePath: 'lib/images/google.png'));
  }

  Widget _userInfo() {
    return SizedBox();
  }

  void _handleGoogleSignIn() {
    try {
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(_googleAuthProvider);
    } catch (error) {
      print(error);
    }
  }
}
