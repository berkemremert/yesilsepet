import 'package:flutter/material.dart';

import '../../../dashboardPage/widgets/recipe_card.dart';
import '../../../theme/appColors.dart';

Widget LastPage(var recipes) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(height: 20),
      const Text(
        "Tarifleriniz hazır!",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 20),
      SizedBox(
        height: 400,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return RecipeCard(
              recipe: recipes[index],
            );
          },
        ),
      ),
    ],
  );
}