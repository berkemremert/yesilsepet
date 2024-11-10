import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/ingredient_list.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/new_ingredients_search_bar.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';
import '../../ViewModels/createRecipe/CreateRecipeViewModel.dart';

class IngredientsPage extends StatelessWidget {
  const IngredientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CreateRecipeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.green,
          title: const Text(
            "Tarif Oluştur!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: AppColors.offWhite,
        body: Column(
          children: [
            // Progress bar and buttons
            const ProgressBarSection(),
            const SizedBox(height: 10),
            const NewIngredientSearchBar(),
            const SizedBox(height: 10),
            const IngredientList(),
          ],
        ),
      ),
    );
  }
}

class ProgressBarSection extends StatelessWidget {
  const ProgressBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    double progress = 0.5; // Static for now; modify to be dynamic if needed.

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: progress, end: progress),
            duration: const Duration(milliseconds: 500),
            builder: (context, value, child) {
              return LinearProgressIndicator(
                value: value,
                backgroundColor: AppColors.lightGray,
                color: AppColors.green,
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove_circle_outline, color: AppColors.green),
              onPressed: () {},
            ),
            const SizedBox(width: 20),
            IconButton(
              icon: Icon(Icons.add_circle_outline, color: AppColors.green),
              onPressed: () {
                // Retrieve the view model and print the current malzemeler list
                final viewModel = Provider.of<CreateRecipeViewModel>(context, listen: false);
                print(viewModel.malzemeler);
              },
            ),
          ],
        ),
      ],
    );
  }
}