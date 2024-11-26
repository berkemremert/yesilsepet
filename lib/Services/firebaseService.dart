import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> createAccount({
    required String email,
    required String password,
    required String name,
    required String surname,
    required String username,
    required String phoneNumber,
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;

      await _firestore.collection('users').doc(uid).set({
        'name': name,
        'surname': surname,
        'username': username,
        'email': email,
        'phoneNumber': phoneNumber,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return null;
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors
      return e.message;
    } catch (e) {
      // Handle other errors
      return 'An error occurred. Please try again.';
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return 'An error occurred. Please try again.';
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
