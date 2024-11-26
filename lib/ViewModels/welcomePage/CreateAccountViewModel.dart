import 'package:flutter/material.dart';
import '../../Services/firebaseService.dart';

class CreateAccountViewModel extends ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();

  Future<void> createAccount({
    required String email,
    required String password,
    required String name,
    required String surname,
    required String username,
    required String phoneNumber,
  }) async {
    String? result = await _firebaseService.createAccount(
      email: email,
      password: password,
      name: name,
      surname: surname,
      username: username,
      phoneNumber: phoneNumber,
    );

    if (result == null) {
    } else {
      print(result);
    }
  }
}
