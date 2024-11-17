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
      child: CustomPaint(
        size: Size(double.infinity, 10), // Height of the progress bar
        painter: ProgressBarPainter(progress),
      ),
    );
  }
}

class ProgressBarPainter extends CustomPainter {
  final double progress;

  ProgressBarPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = AppColors.lightGray
      ..style = PaintingStyle.fill;

    final Paint progressPaint = Paint()
      ..shader = LinearGradient(
        colors: [AppColors.coralOrangeDark, AppColors.coralOrange],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    // Draw the background bar
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    // Draw the progress bar with gradient
    final progressWidth = size.width * progress;
    canvas.drawRect(Rect.fromLTWH(0, 0, progressWidth, size.height), progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint unless the progress value changes
  }
}