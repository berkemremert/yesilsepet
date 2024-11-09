import 'package:flutter/material.dart';

class LoginLink extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginLink({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        'Already have an account? Login',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}