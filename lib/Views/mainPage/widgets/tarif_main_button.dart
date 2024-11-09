import 'dart:ui';
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 130),
        ElevatedButton(
          onPressed: () {
            // TODO: IMPLEMENT
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.oliveGreen,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Tarif Oluştur',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.pureWhite,
            ),
          ),
        ),
        // Stack(
        //   children: [
        //     // Blurred Image Background
        //     ClipRRect(
        //       borderRadius: BorderRadius.circular(8),
        //       child: Image.asset(
        //         'assets/grocery.jpg',
        //         height: 150,
        //         width: double.infinity,
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //     Positioned.fill(
        //       child: BackdropFilter(
        //         filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        //         child: Container(
        //           color: Colors.black.withOpacity(0.3), // Overlay color
        //         ),
        //       ),
        //     ),
        //
        //     // Button positioned at the bottom of the image
        //     Positioned(
        //       bottom: 16, // Adjusts the distance from the bottom
        //       left: 16,
        //       right: 16,
        //       child: ElevatedButton(
        //         onPressed: () {
        //           // TODO: IMPLEMENT
        //         },
        //         style: ElevatedButton.styleFrom(
        //           backgroundColor: AppColors.oliveGreen,
        //           padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(8),
        //           ),
        //         ),
        //         child: const Text(
        //           'Tarif Oluştur',
        //           style: TextStyle(
        //             fontSize: 16,
        //             fontWeight: FontWeight.bold,
        //             color: AppColors.pureWhite,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),

        const SizedBox(height: 8),
      ],
    );
  }
}