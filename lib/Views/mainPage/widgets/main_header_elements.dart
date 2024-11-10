import 'package:flutter/material.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';

class MainHeaderElements extends StatelessWidget {
  final VoidCallback openDrawer;

  const MainHeaderElements({super.key, required this.openDrawer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Aligns all content to the left
        children: [
          Text(
            'Yeşil Tarif',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.offWhite,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight, // Aligns text to the right
              child: GestureDetector(
                onTap: openDrawer,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/adam.jpeg'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}