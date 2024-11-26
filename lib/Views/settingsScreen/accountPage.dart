import 'package:flutter/material.dart';
import 'package:yesilsepet/Models/user_model.dart';
import 'package:yesilsepet/services/firebaseService.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isNameEditable = false;
  bool isSurnameEditable = false;
  bool isEmailEditable = false;
  bool isPhoneEditable = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  late User user;
  final FirebaseService _firebaseService = FirebaseService();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    final userData = await _firebaseService.getUserProfileData();
    setState(() {
      user = User(
        firstName: userData['name'] ?? 'John',
        lastName: userData['surname'] ?? 'Doe',
        email: userData['email'] ?? 'email@mail.com',
        phone: userData['phoneNumber'] ?? '+1234567890',
        profilePictureUrl: userData['profilePictureUrl'], // Include profile picture URL
      );
      nameController.text = user.firstName;
      surnameController.text = user.lastName;
      emailController.text = user.email;
      phoneController.text = user.phone;
    });
  }

  void _toggleEditable(String field) {
    setState(() {
      if (field == 'name') {
        isNameEditable = !isNameEditable;
      } else if (field == 'surname') {
        isSurnameEditable = !isSurnameEditable;
      } else if (field == 'email') {
        isEmailEditable = !isEmailEditable;
      } else if (field == 'phone') {
        isPhoneEditable = !isPhoneEditable;
      }
    });
  }

  Future<void> _saveUserData() async {
    String? result = await _firebaseService.updateUser(
      name: nameController.text,
      surname: surnameController.text,
      phoneNumber: phoneController.text,
    );
    if (result == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile updated successfully!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $result')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Account')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: user.profilePictureUrl != null && user.profilePictureUrl!.isNotEmpty
                          ? NetworkImage(user.profilePictureUrl!)
                          : AssetImage('assets/default_profile_picture.webp') as ImageProvider,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 10),
              _buildEditableField(
                label: 'First Name',
                controller: nameController,
                isEditable: isNameEditable,
                field: 'name',
              ),
              SizedBox(height: 10),
              _buildEditableField(
                label: 'Last Name',
                controller: surnameController,
                isEditable: isSurnameEditable,
                field: 'surname',
              ),
              SizedBox(height: 10),
              _buildEditableField(
                label: 'Email Address',
                controller: emailController,
                isEditable: isEmailEditable,
                field: 'email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              _buildEditableField(
                label: 'Phone Number',
                controller: phoneController,
                isEditable: isPhoneEditable,
                field: 'phone',
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField({
    required String label,
    required TextEditingController controller,
    required bool isEditable,
    required String field,
    TextInputType? keyboardType,
  }) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            enabled: isEditable,
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(),
            ),
            keyboardType: keyboardType,
          ),
        ),
        IconButton(
          icon: Icon(isEditable ? Icons.save : Icons.edit),
          onPressed: () {
            if (isEditable) {
              _toggleEditable(field);
              _saveUserData();
            } else {
              _toggleEditable(field);
            }
          },
        ),
      ],
    );
  }
}