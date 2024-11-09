import 'package:flutter/material.dart';
import '../../../Models/recipe_model.dart';
import '../../theme/appColors.dart';

class RecipeCard extends StatelessWidget {
  final RecipeModel recipe;
  final double cardWidth = 250;
  final double cardHeight = 350;

  RecipeCard({
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        width: cardWidth,
        height: cardHeight,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.orange, AppColors.scarletOrange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Container(
                  height: cardHeight * 0.6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(recipe.imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.title,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 20.0,
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: recipe.badges.map((badge) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              badge,
                              size: 24,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 20.0,
                                  color: Colors.black.withOpacity(0.3),
                                  offset: const Offset(2.0, 2.0),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}