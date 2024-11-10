import 'package:flutter/material.dart';
import 'package:yesilsepet/Models/user_model.dart';

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

  @override
  void initState() {
    super.initState();
    user = User(
      firstName: "John",
      lastName: "Doe",
      email: "john.doe@example.com",
      phone: "+1234567890",
    );

    nameController.text = user.firstName;
    surnameController.text = user.lastName;
    emailController.text = user.email;
    phoneController.text = user.phone;
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
                      backgroundImage: NetworkImage(
                        'https://fcb-abj-pre.s3.amazonaws.com/img/jugadors/MESSI.jpg',
                      ),
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
            } else {
              _toggleEditable(field);
            }
          },
        ),
      ],
    );
  }
}