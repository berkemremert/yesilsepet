import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui'; // For BackdropFilter

import '../../../Models/recipe_model.dart';
import '../../theme/appColors.dart';

class RecipeCard extends StatelessWidget {
  final RecipeModel recipe;

  RecipeCard({required this.recipe});

  Widget _getBadgeIcon(String badge) {
    IconData icon;
    switch (badge) {
      case 'Vegetarian':
        icon = FontAwesomeIcons.leaf;
        break;
      case 'Gluten-Free':
        icon = FontAwesomeIcons.wheatAwn;
        break;
      case 'Low Sugar':
        icon = FontAwesomeIcons.heart;
        break;
      default:
        icon = FontAwesomeIcons.circle;
        break;
    }
    return CircleAvatar(
      backgroundColor: AppColors.green,
      radius: 16,
      child: FaIcon(icon, color: Colors.white, size: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 300,
        height: 450,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    color: AppColors.limeGreen.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            // Content inside the card
            Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      // Recipe Image
                      Positioned(
                        bottom: 80,
                        right: 20,
                        child: Image.asset(
                          recipe.imagePath,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                // Title and Badges
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title Text with spread shadow effect
                      Text(
                        recipe.title,
                        style: TextStyle(
                          color: AppColors.pureWhite, // Text color changed to white for contrast
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: AppColors.oliveGreen.withOpacity(0.6),
                              offset: Offset(3, 3),
                              blurRadius: 10,
                            ),
                            Shadow(
                              color: AppColors.oliveGreen.withOpacity(0.3),
                              offset: Offset(-3, -3),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 60),
                        child: Divider(
                          color: AppColors.green,
                          thickness: 1,
                          height: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: recipe.badges.map((badge) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: _getBadgeIcon(badge),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
