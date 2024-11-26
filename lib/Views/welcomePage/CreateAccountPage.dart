import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesilsepet/ViewModels/welcomePage/CreateAccountViewModel.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';
import 'package:yesilsepet/Views/welcomePage/widgets/create_account_page_header.dart';
import 'package:yesilsepet/Views/welcomePage/widgets/create_page_insider_button.dart';
import 'package:yesilsepet/Views/welcomePage/widgets/gradient_text_field.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CreateAccountViewModel>(context);

    final nameController = TextEditingController();
    final surnameController = TextEditingController();
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/grocery.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.black.withOpacity(0),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  decoration: BoxDecoration(
                    color: AppColors.pureWhite,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CreatePageHeader(),
                      const SizedBox(height: 24),
                      GradientTextField(
                        label: 'Name',
                        controller: nameController,
                      ),
                      const SizedBox(height: 16),
                      GradientTextField(
                        label: 'Surname',
                        controller: surnameController,
                      ),
                      const SizedBox(height: 16),
                      GradientTextField(
                        label: 'Username',
                        controller: usernameController,
                      ),
                      const SizedBox(height: 16),
                      GradientTextField(
                        label: 'Email',
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),
                      GradientTextField(
                        label: 'Phone Number',
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 16),
                      GradientTextField(
                        label: 'Password',
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 32),
                      CreateAccountInsiderButton(
                        onPressed: () {
                          viewModel.createAccount(
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text,
                            surname: surnameController.text,
                            username: usernameController.text,
                            phoneNumber: phoneController.text,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

