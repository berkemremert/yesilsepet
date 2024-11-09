import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ViewModels/WelcomePage/WelcomeViewModel.dart';
import 'widgets/welcome_header.dart';
import 'widgets/welcome_message.dart';
import 'widgets/social_login_button.dart';
import 'widgets/create_account_button.dart';
import 'widgets/login_link.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';


class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WelcomeViewModel>(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/grocery.jpg',
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
                      WelcomeHeader(),
                      const SizedBox(height: 16,),
                      WelcomeMessage(),
                      const SizedBox(height: 32),
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
