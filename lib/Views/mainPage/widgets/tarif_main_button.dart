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
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [
              AppColors.coralOrange,
              AppColors.scarletOrange,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.2),
              offset: const Offset(2, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: const Center(
          child: Icon(
              Icons.add,
            color: AppColors.pureWhite,
          ),
        ),
      ),
    );
  }
}