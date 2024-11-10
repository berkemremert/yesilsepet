import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/appColors.dart';

class DefaultLabelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        decoration: BoxDecoration(
          color: AppColors.verylightGray,
        ),
        child: Text(
          'DEFAULT',
          style: TextStyle(
            fontSize: 7,
            fontWeight: FontWeight.bold,
            color: AppColors.oliveGreen,
          ),
        ),
      ),
    );
  }
}
