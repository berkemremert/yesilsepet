import 'package:flutter/material.dart';

class WelcomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: Text(
        'Welcome',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}