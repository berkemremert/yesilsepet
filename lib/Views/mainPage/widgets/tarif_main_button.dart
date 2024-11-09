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
    return InkWell(
      onTap: () {
        // TODO: IMPLEMENT
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              AppColors.limeGreen,
              AppColors.green,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Text(
          'Yeni Tarif Oluştur',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.pureWhite,
          ),
        ),
      ),
    );
  }
}