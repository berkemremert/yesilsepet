import 'package:flutter/material.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';

class TextInputAddress extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final Icon? prefixIcon;

  TextInputAddress({
    required this.label,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 40,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.greenishWhite, AppColors.greenishWhite],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
            prefixIcon: prefixIcon != null
                ? Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColors.greenishWhite,
                borderRadius: BorderRadius.circular(8),
              ),
              child: prefixIcon,
            )
                : null,
            border: InputBorder.none,
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }
}