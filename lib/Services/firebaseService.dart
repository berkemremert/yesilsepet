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
      return e.message;
    } catch (e) {
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

  Future<Map<String, dynamic>?> getUser() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      try {
        DocumentSnapshot userSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();
        return userSnapshot.data() as Map<String, dynamic>?;
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  Future<String?> getUserName() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      try {
        DocumentSnapshot userSnapshot = await _firestore.collection('users').doc(currentUser.uid).get();
        var userData = userSnapshot.data() as Map<String, dynamic>?;
        return userData?['name'];
      } catch (e) {
        print("Error fetching user data: $e");
        return null;
      }
    }
    return null;
  }

  Future<String?> updateUser({
    required String name,
    required String surname,
    required String phoneNumber,
  }) async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      try {
        await _firestore.collection('users').doc(currentUser.uid).update({
          'name': name,
          'surname': surname,
          'phoneNumber': phoneNumber,
          'updatedAt': FieldValue.serverTimestamp(),
        });
        return null;
      } catch (e) {
        return 'An error occurred while updating user information.';
      }
    }
    return 'No user is logged in.';
  }

  Future<Map<String, String?>> getUserProfileData() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      try {
        DocumentSnapshot userSnapshot = await _firestore.collection('users').doc(currentUser.uid).get();

        if (userSnapshot.exists) {
          var userData = userSnapshot.data() as Map<String, dynamic>;

          String name = userData['name'] ?? 'No Name';
          String surname = userData['surname'] ?? 'No Surname';
          String? profilePictureUrl = userData['profilePictureUrl'];  // This could be null if not set

          return {
            'name': name,
            'surname': surname,
            'profilePictureUrl': profilePictureUrl,
          };
        } else {
          return {
            'name': 'No Name',
            'surname': 'No Surname',
            'profilePictureUrl': null,
          };
        }
      } catch (e) {
        print("Error fetching user profile data: $e");
        return {
          'name': 'No Name',
          'surname': 'No Surname',
          'profilePictureUrl': null,
        };
      }
    } else {
      return {
        'name': 'No Name',
        'surname': 'No Surname',
        'profilePictureUrl': null,
      };
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }
}