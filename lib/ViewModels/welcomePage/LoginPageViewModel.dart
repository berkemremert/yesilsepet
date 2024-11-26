import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yesilsepet/Services/firebaseService.dart';

class LoginPageViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseService _firebaseService = FirebaseService();

  Future<String?> login({required String username, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: username,
        password: password,
      );

      print('Logged in: ${userCredential.user?.email}');
      return null;
    } catch (e) {
      print('Login error: $e');
      return 'Login failed. Please check your credentials and try again.';
    }
  }

  Future<void> saveUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var userInfo = await _firebaseService.getUser();
      if (userInfo != null) {
        print('User info saved: $userInfo');
      } else {
        print('User info not found in Firestore');
      }
    }
  }
}