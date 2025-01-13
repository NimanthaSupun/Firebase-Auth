import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // todo: Signin Anonymous
  Future<void> signInAnonymously() async {
    try {
      final UserCredential userCredential = await _auth.signInAnonymously();
      final user = userCredential.user;

      if (user != null) {
        print("Sign in Anonymously successfull: ${user.uid}");
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == "operation-not-allowed") {
        print("operation-not-allowed");
        throw Exception("operation-not-allowed");
      } else {
        print("Firebas Auth Exception: ${error}");
      }
    } catch (error) {
      print("Error sign in Anonymously: ${error}");
    }
  }

  // get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
