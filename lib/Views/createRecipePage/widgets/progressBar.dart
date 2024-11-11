import 'package:flutter/material.dart';
import '../../theme/appColors.dart';

class ProgressBarSection extends StatelessWidget {
  final int currentStep;

  const ProgressBarSection({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    double progress = (currentStep + 1) / 3; // Calculate progress dynamically

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: progress, end: progress),
        duration: const Duration(milliseconds: 500),
        builder: (context, value, child) {
          return LinearProgressIndicator(
            value: value,
            minHeight: 8,
            backgroundColor: AppColors.lightGray,
            color: AppColors.scarletOrange,
          );
        },
      ),
    );
  }
}