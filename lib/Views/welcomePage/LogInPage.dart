import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesilsepet/ViewModels/welcomePage/LoginPageViewModel.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';
import 'package:yesilsepet/Views/welcomePage/widgets/gradient_text_field.dart';
import 'package:yesilsepet/Views/welcomePage/widgets/login_button.dart';
import 'package:yesilsepet/Views/welcomePage/widgets/login_header.dart';
import 'package:yesilsepet/Views/dashboardPage/dashboardPage.dart';  // Import your DashboardPage

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginPageViewModel>(context);

    final usernameController = TextEditingController();
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
                  decoration: const BoxDecoration(
                    color: AppColors.pureWhite,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LoginHeader(),
                      const SizedBox(height: 24),
                      GradientTextField(
                        label: 'Username',
                        controller: usernameController,
                      ),
                      const SizedBox(height: 16),
                      GradientTextField(
                        label: 'Password',
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 32),
                      LoginButton(
                        onPressed: () async {
                          String? error = await viewModel.login(
                            username: usernameController.text,
                            password: passwordController.text,
                          );

                          if (error == null) {
                            await viewModel.saveUserInfo();  // Save user info to Firebase
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => DashboardPage()),  // Navigate to DashboardPage
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error: $error')),
                            );
                          }
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
