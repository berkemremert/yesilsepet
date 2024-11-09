import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        'Login',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}