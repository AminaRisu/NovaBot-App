import 'package:firebase_auth/firebase_auth.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Signup user
  Future<String> signupUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Update user display name
      userCredential.user?.updateDisplayName(name);
      return "success";
    } catch (e) {
      return e.toString();
    }
  }

  // Login user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "success";
    } catch (e) {
      return e.toString();
    }
  }
}
