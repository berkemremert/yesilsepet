import 'package:flutter/material.dart';

class CreatePageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        'Sign In',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}