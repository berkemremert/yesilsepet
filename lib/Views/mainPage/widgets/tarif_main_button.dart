import 'package:flutter/material.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';

class TarifMainButton extends StatefulWidget {
  const TarifMainButton({super.key});

  @override
  State<TarifMainButton> createState() => _TarifMainButtonState();
}

class _TarifMainButtonState extends State<TarifMainButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: IMPLEMENT
      },
      child: Container(
        width: 56,  // Set a fixed width
        height: 56, // Set a fixed height to make the circle
        decoration: BoxDecoration(
          shape: BoxShape.circle, // Makes the container a circle
          gradient: LinearGradient(
            colors: [
              AppColors.limeGreen,
              AppColors.green,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(2, 4),
              blurRadius: 8,
            ),
          ], // Subtle shadow for depth
        ),
        child: Center(
          child: Text(
            '+',
            style: TextStyle(
              fontSize: 32, // Slightly smaller text size
              fontWeight: FontWeight.bold,
              color: AppColors.pureWhite,
              letterSpacing: 1.2, // Slight spacing to make it more readable
            ),
          ),
        ),
      ),
    );
  }
}