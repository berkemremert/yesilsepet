import 'package:flutter/material.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';

class LoginLink extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginLink({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: const Text(
        'Already have an account? Login',
        style: TextStyle(color: AppColors.oliveGreen),
      ),
    );
  }
}