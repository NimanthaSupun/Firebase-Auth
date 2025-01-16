import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_test/exceptions/auth_exception.dart';

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

  // sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (error) {
      print("Error singout: ${mapFirebaseAuthExceptionCode(error.code)}");
      throw mapFirebaseAuthExceptionCode(error.code);
    } catch (error) {
      print("Error signout: ${error}");
    }
  }

  //todo:-create user with email and password
  // Future<void> registerNewUser(
  //     {required String email, required String password}) async {
  //   try {
  //     await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //   } on FirebaseAuthException catch (error) {
  //     print("Error creating user: ${mapFirebaseAuthExceptionCode(error.code)}");
  //     throw Exception(mapFirebaseAuthExceptionCode(error.code));
  //   } catch (error) {
  //     print("Error Creating user: ${error}");
  //   }
  // }

  // gpt
  Future<void> registerNewUser({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user != null && !user.emailVerified) {
        
        await user.sendEmailVerification();
        print("Verification email sent to ${user.email}");
      }
    } on FirebaseAuthException catch (error) {
      print("Error creating user: ${mapFirebaseAuthExceptionCode(error.code)}");
      throw Exception(mapFirebaseAuthExceptionCode(error.code));
    } catch (error) {
      print("Error creating user: $error");
    }
  }

  // todo: sing in user
  // Future<void> signInNewUser(
  //     {required String email, required String password}) async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //   } on FirebaseAuthException catch (error) {
  //     print("Error Sing in user: ${mapFirebaseAuthExceptionCode(error.code)}");
  //     throw mapFirebaseAuthExceptionCode(error.code);
  //   } catch (error) {
  //     print("Error sing in user: ${error}");
  //   }
  // }

  // login User
  Future<void> signInNewUser({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user != null && !user.emailVerified) {
        throw Exception("Please verify your email before logging in.");
      }
    } on FirebaseAuthException catch (error) {
      print("Error logging in: ${mapFirebaseAuthExceptionCode(error.code)}");
      throw Exception(mapFirebaseAuthExceptionCode(error.code));
    } catch (error) {
      print("Error logging in: $error");
      throw Exception("An error occurred during login.");
    }
  }
}
