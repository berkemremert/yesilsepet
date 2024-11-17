import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/ingredient_list.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/new_ingredients_search_bar.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/progressBar.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';
import '../../ViewModels/createRecipe/CreateRecipeViewModel.dart';

class IngredientsPage extends StatefulWidget {
  const IngredientsPage({super.key});

  @override
  _IngredientsPageState createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
  final PageController _pageController = PageController();
  int _currentStep = 0;

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
      _pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
      _pageController.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CreateRecipeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[AppColors.green, AppColors.limeGreen]),
            ),
          ),
          title: const Text(
            "Tarif Oluştur!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: AppColors.offWhite,
        body: SingleChildScrollView(  // Wrapping the body in SingleChildScrollView
          child: Column(
            children: [
              ProgressBarSection(currentStep: _currentStep),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7, // Adjusting the height to fit the keyboard
                child: PageView(
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    // Step 1: Ingredients
                    Column(
                      children: [
                        SizedBox(height: 10),
                        NewIngredientSearchBar(),
                        SizedBox(height: 10),
                        IngredientList(),
                      ],
                    ),
                    // Step 2: Instructions
                    Center(child: Text("Add Recipe Instructions")),
                    // Step 3: Final Review
                    Center(child: Text("Review and Finish")),
                  ],
                ),
              ),
              Divider(color: AppColors.oliveGreen),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (_currentStep > 0)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.verylightGray, // Red color on steps 2 and 3
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: _previousStep,
                        child: const Text(
                          "Geri",
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.coralOrange,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: _nextStep,
                      child: Text(
                        _currentStep == 2 ? "Oluştur" : "İleri", // Change text on last step
                        style: const TextStyle(
                          color: AppColors.pureWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}