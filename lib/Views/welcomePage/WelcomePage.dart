import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesilsepet/ViewModels/welcomePage/CreateAccountViewModel.dart';
import 'package:yesilsepet/Views/welcomePage/LogInPage.dart';
import '../../ViewModels/WelcomePage/WelcomeViewModel.dart';
import '../../ViewModels/welcomePage/LoginPageViewModel.dart';
import 'CreateAccountPage.dart';
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

    void createAccount() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (_) => CreateAccountViewModel(),
            child: const CreateAccountPage(),
          ),
        ),
      );
    }

    void loginAccount() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (_) => LoginPageViewModel(),
            child: const LoginPage(),
          ),
        ),
      );
    }

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
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 100,
            child: Center(
              child: Text(
                'Suup',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: AppColors.pureWhite,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              ),
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
                      const SizedBox(height: 16),
                      WelcomeMessage(),
                      const SizedBox(height: 32),
                      SocialLoginButton(
                        onPressed: viewModel.signInWithGoogle,
                      ),
                      const SizedBox(height: 16),
                      CreateAccountButton(
                        onPressed: createAccount,
                      ),
                      const SizedBox(height: 16),
                      LoginLink(
                        onPressed: loginAccount,
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