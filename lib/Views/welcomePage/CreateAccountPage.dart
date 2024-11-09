import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesilsepet/Views/welcomePage/widgets/create_account_page_header.dart';
import 'package:yesilsepet/Views/welcomePage/widgets/create_page_insider_button.dart';
import 'package:yesilsepet/Views/welcomePage/widgets/gradient_text_field.dart';
import '../../ViewModels/welcomePage/CreateAccountViewModel.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CreateAccountViewModel>(context);

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
                      GradientTextField(label: 'Name'),
                      const SizedBox(height: 16),
                      GradientTextField(label: 'Surname'),
                      const SizedBox(height: 16),
                      GradientTextField(label: 'Username'),
                      const SizedBox(height: 16),
                      GradientTextField(label: 'Email', keyboardType: TextInputType.emailAddress,),
                      const SizedBox(height: 16),
                      GradientTextField(label: 'Phone Number', keyboardType: TextInputType.phone),
                      const SizedBox(height: 16),
                      GradientTextField(label: 'Password'),
                      const SizedBox(height: 32),
                      CreateAccountInsiderButton(
                        onPressed: viewModel.createAccount,
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