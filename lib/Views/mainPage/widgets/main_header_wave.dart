import 'package:flutter/material.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';

class MainHeaderWave extends StatefulWidget {
  final double greenBarHeight;

  const MainHeaderWave({super.key, required this.greenBarHeight});

  @override
  State<MainHeaderWave> createState() => _MainHeaderWaveState();
}

class _MainHeaderWaveState extends State<MainHeaderWave> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ClipPath(
        clipper: WavyClipper(),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.green,
                AppColors.limeGreen,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          height: widget.greenBarHeight,
        ),
      ),
    );
  }
}

class WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(size.width / 4, size.height, size.width / 2, size.height - 30);
    path.quadraticBezierTo(3 * size.width / 4, size.height - 60, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}