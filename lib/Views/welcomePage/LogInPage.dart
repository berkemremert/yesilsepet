import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesilsepet/ViewModels/welcomePage/LoginPageViewModel.dart';
import 'package:yesilsepet/Views/welcomePage/widgets/create_account_page_header.dart';
import 'package:yesilsepet/Views/welcomePage/widgets/gradient_text_field.dart';
import 'package:yesilsepet/Views/welcomePage/widgets/login_button.dart';
import 'package:yesilsepet/Views/welcomePage/widgets/login_header.dart';
import '../../ViewModels/welcomePage/CreateAccountViewModel.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';
import 'widgets/create_account_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginPageViewModel>(context);

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
                      GradientTextField(label: 'Username'),
                      const SizedBox(height: 16),
                      GradientTextField(label: 'Password'),
                      const SizedBox(height: 32),
                      LoginButton(
                        onPressed: viewModel.login,
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