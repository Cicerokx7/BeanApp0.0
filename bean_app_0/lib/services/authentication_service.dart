// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthenticationService {
//   signInWithGoogle() async {
//     //Begin sign in
//     final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

//     //obtain details
//     final GoogleSignInAuthentication gAuth = await gUser!.authentication;

//     //create new user
//     final credential = GoogleAuthProvider.credential(
//       accessToken: gAuth.accessToken,
//       idToken: gAuth.idToken,
//     );
//     //sign in
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  Future<User?> signInWithGoogle() async {
    try {
      // Begin sign in
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      if (gUser == null) {
        // User canceled sign-in
        return null;
      }

      // Obtain details
      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      // Create new user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // Sign in
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print("Error signing in with Google: $e");
      return null;
    }
  }
}
