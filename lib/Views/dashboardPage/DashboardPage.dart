import 'package:flutter/material.dart';
import 'package:yesilsepet/Views/dashboardPage/widgets/create_recipe_button.dart';
import 'package:yesilsepet/Views/dashboardPage/widgets/magic_box_button.dart';
import 'package:yesilsepet/Views/dashboardPage/widgets/old_recipes_button.dart';
import 'package:yesilsepet/Views/dashboardPage/widgets/profile_picture_button.dart';
import 'package:yesilsepet/Views/dashboardPage/widgets/recipe_card.dart';
import 'package:yesilsepet/Views/dashboardPage/widgets/search_bar.dart';
import '../../ViewModels/DashboardPage/RecipeViewModel.dart';
import '../../Services/FirebaseService.dart';

class DashboardPage extends StatelessWidget {
  final DashboardViewModel viewModel = DashboardViewModel();
  final FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    final recipes = viewModel.getRecipes();

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 40,),
            // Use FutureBuilder to get current user's name
            FutureBuilder<String?>(
              future: _firebaseService.getUserName(), // Get user's name
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Text('No user data available');
                } else {
                  // Pass the user's name to the ProfilePictureButton
                  return ProfilePictureButton(
                    height: 165,
                    name: snapshot.data!, // Display the user's name
                    score: "200", // Replace with actual score if needed
                  );
                }
              },
            ),
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
