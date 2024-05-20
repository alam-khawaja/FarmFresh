import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthService._();

  static Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Sign Up Error: $e');
      throw _handleFirebaseAuthException(e);
    } catch (e) {
      print('Unexpected Error: $e');
      throw Exception('An unexpected error occurred during sign up.');
    }
  }

  static Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Sign In Error: $e');
      throw _handleFirebaseAuthException(e);
    } catch (e) {
      print('Unexpected Error: $e');
      throw Exception('An unexpected error occurred during sign in.');
    }
  }

  static Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      print('Sign Out Error: $e');
      throw Exception('An error occurred during sign out.');
    }
  }

  static Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print('Password Reset Error: $e');
      throw _handleFirebaseAuthException(e);
    } catch (e) {
      print('Unexpected Error: $e');
      throw Exception('An unexpected error occurred during password reset.');
    }
  }

  static User? getCurrentUser() {
    try {
      return _firebaseAuth.currentUser;
    } catch (e) {
      print('Get Current User Error: $e');
      throw Exception('An error occurred while fetching the current user.');
    }
  }

  static Exception _handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return Exception(
            'The email address is already in use by another account.');
      case 'invalid-email':
        return Exception('The email address is not valid.');
      case 'operation-not-allowed':
        return Exception('Email/password accounts are not enabled.');
      case 'weak-password':
        return Exception('The password is too weak.');
      case 'user-not-found':
        return Exception('No user found for that email.');
      case 'wrong-password':
        return Exception('Wrong password provided.');
      default:
        return Exception('Authentication error: ${e.message}');
    }
  }

  static Stream<User?> getAuthStateChanges() {
    return _firebaseAuth.authStateChanges();
  }
}
