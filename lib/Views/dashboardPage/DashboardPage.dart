import 'package:flutter/material.dart';
import 'package:yesilsepet/Views/dashboardPage/widgets/create_recipe_button.dart';
import 'package:yesilsepet/Views/dashboardPage/widgets/magic_box_button.dart';
import 'package:yesilsepet/Views/dashboardPage/widgets/old_recipes_button.dart';
import 'package:yesilsepet/Views/dashboardPage/widgets/profile_picture_button.dart';
import 'package:yesilsepet/Views/dashboardPage/widgets/recipe_card.dart';
import 'package:yesilsepet/Views/dashboardPage/widgets/search_bar.dart';
import '../../ViewModels/DashboardPage/RecipeViewModel.dart';

class DashboardPage extends StatelessWidget {
  final RecipeViewModel viewModel = RecipeViewModel();

  @override
  Widget build(BuildContext context) {
    final recipes = viewModel.getRecipes();

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            ProfilePictureButton(height: 165, name: "Berk Emre Mert", score: "200",),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CreateRecipeButton(
                        height: 350,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      MagicBoxButton(
                        height: 165,
                      ),
                      OldRecipesButton(
                        height: 165,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            SearchBarWidget(
              onSearchChanged: (String) {},
            ),
            SizedBox(height: 16.0),
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
        ),
      ),
    );
  }
}
