import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/FilterPages/firstPage.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/FilterPages/lastPage.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/FilterPages/secondPage.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/progressButtons.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/progressBar.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';
import '../../ViewModels/createRecipe/CreateRecipeViewModel.dart';
import '../mainPage/widgets/main_header_elements.dart';
import '../helper_widgets/main_header_wave.dart';

class IngredientsPage extends StatelessWidget {
  IngredientsPage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final CreateRecipeViewModel viewModel = CreateRecipeViewModel();
    final recipes = viewModel.getRecipes();

    return ChangeNotifierProvider(
      create: (_) => CreateRecipeViewModel(),
      child: Consumer<CreateRecipeViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: AppColors.offWhite,
            body: Stack(
              children: [
                const MainHeaderWave(
                  startColor: AppColors.green,
                  endColor: AppColors.limeGreen,
                ),
                Positioned.fill(
                  top: 30,
                  child: Column(
                    children: [
                      MainHeaderElements(openDrawer: openDrawer),
                      SizedBox(height: 30),
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}