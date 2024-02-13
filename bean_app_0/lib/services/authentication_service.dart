import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  signInWithGoogle() async {
    //Begin sign in
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //obtain details
    final GoogleSignInAuthentication googleAuthentication =
        await googleUser!.authentication;

    //create new user
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuthentication.accessToken,
      idToken: googleAuthentication.idToken,
    );
    //sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
