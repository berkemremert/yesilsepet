import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ViewModels/WelcomePage/WelcomeViewModel.dart';
import 'widgets/welcome_header.dart';
import 'widgets/welcome_message.dart';
import 'widgets/social_login_button.dart';
import 'widgets/create_account_button.dart';
import 'widgets/login_link.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WelcomeViewModel>();

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/grocery.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Content overlay
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                WelcomeHeader(),
                WelcomeMessage(),
                const SizedBox(height: 16),
                SocialLoginButton(
                  onPressed: viewModel.signInWithGoogle,
                ),
                const SizedBox(height: 16),
                CreateAccountButton(
                  onPressed: viewModel.createAccount,
                ),
                const SizedBox(height: 16),
                LoginLink(
                  onPressed: viewModel.login,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
