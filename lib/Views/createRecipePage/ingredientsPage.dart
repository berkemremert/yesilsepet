import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/FilterPages/firstPage.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/FilterPages/lastPage.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/FilterPages/secondPage.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/progressButtons.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/progressBar.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';
import 'package:yesilsepet/Views/theme/customAppBar.dart';
import '../../ViewModels/createRecipe/CreateRecipeViewModel.dart';

class IngredientsPage extends StatelessWidget {
  const IngredientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateRecipeViewModel viewModel = CreateRecipeViewModel();
    final recipes = viewModel.getRecipes();

    return ChangeNotifierProvider(
      create: (_) => CreateRecipeViewModel(),
      child: Consumer<CreateRecipeViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: CustomAppBar(),
            backgroundColor: AppColors.offWhite,
            body: Column(
              children: [
                ProgressBarSection(currentStep: viewModel.currentStep),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: PageView(
                    controller: viewModel.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      FirstPage(),
                      SecondPage(),
                      LastPage(recipes),
                    ],
                  ),
                ),
                ProgressButtons(viewModel),
              ],
            ),
          );
        },
      ),
    );
  }
}