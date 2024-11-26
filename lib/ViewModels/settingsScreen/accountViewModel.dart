import 'package:flutter/material.dart';
import 'package:yesilsepet/Models/user_model.dart';
import 'package:yesilsepet/services/firebaseService.dart';

class AccountViewModel extends ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();

  User user = User(
    firstName: 'John',
    lastName: 'Doe',
    email: 'email@mail.com',
    phone: '+1234567890',
    profilePictureUrl: null,
  );

  bool isNameEditable = false;
  bool isSurnameEditable = false;
  bool isEmailEditable = false;
  bool isPhoneEditable = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  AccountViewModel() {
    loadUserData();
  }

  Future<void> loadUserData() async {
    final userData = await _firebaseService.getUserProfileData();
    user = User(
      firstName: userData['name'] ?? 'John',
      lastName: userData['surname'] ?? 'Doe',
      email: userData['email'] ?? 'email@mail.com',
      phone: userData['phoneNumber'] ?? '+1234567890',
      profilePictureUrl: userData['profilePictureUrl'],
    );
    nameController.text = user.firstName;
    surnameController.text = user.lastName;
    emailController.text = user.email;
    phoneController.text = user.phone;
    notifyListeners();
  }

  void toggleEditable(String field) {
    if (field == 'name') {
      isNameEditable = !isNameEditable;
    } else if (field == 'surname') {
      isSurnameEditable = !isSurnameEditable;
    } else if (field == 'email') {
      isEmailEditable = !isEmailEditable;
    } else if (field == 'phone') {
      isPhoneEditable = !isPhoneEditable;
    }
    notifyListeners();
  }

  Future<void> saveUserData() async {
    String? result = await _firebaseService.updateUser(
      name: nameController.text,
      surname: surnameController.text,
      phoneNumber: phoneController.text,
    );
    if (result == null) {
    } else {
    }
    notifyListeners();
  }
}
