import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:yesilsepet/Views/createRecipePage/filterPage.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/ingredient_list.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/new_ingredients_search_bar.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/progressBar.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';
import '../../Models/recipe_model.dart';
import '../../ViewModels/createRecipe/CreateRecipeViewModel.dart';
import '../dashboardPage/widgets/recipe_card.dart';

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
    final recipes = [
      RecipeModel(
        title: 'Delicious Pasta',
        imagePath: 'https://www.cnet.com/a/img/resize/69256d2623afcbaa911f08edc45fb2d3f6a8e172/hub/2023/02/03/afedd3ee-671d-4189-bf39-4f312248fb27/gettyimages-1042132904.jpg?auto=webp&fit=crop&height=675&width=1200',
        badges: [
          FontAwesomeIcons.heart,
          FontAwesomeIcons.star,
          FontAwesomeIcons.utensils,
        ],
      ),
      RecipeModel(
        title: 'Chocolate Cake',
        imagePath: 'https://images.immediate.co.uk/production/volatile/sites/30/2022/08/Corndogs-7832ef6.jpg?quality=90&resize=556,505',
        badges: [
          FontAwesomeIcons.heart,
          FontAwesomeIcons.cake,
        ],
      ),
      RecipeModel(
        title: 'Grilled Chicken',
        imagePath: 'https://foodinstitute.com/wp-content/uploads/2024/02/organic.jpg',
        badges: [
          FontAwesomeIcons.heart,
          FontAwesomeIcons.fire,
          FontAwesomeIcons.leaf,
        ],
      ),
    ];

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProgressBarSection(currentStep: _currentStep),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    firstPage(),
                    secondPage(),
                    lastPage(recipes),
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
                          backgroundColor: AppColors.verylightGray,
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
                    if (_currentStep < 2)
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
                          _currentStep == 1 ? "Oluştur" : "İleri",
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
  Widget firstPage(){
    return const Column(
      children: [
        SizedBox(height: 10),
        NewIngredientSearchBar(),
        SizedBox(height: 10),
        IngredientList(),
      ],
    );
  }
  Widget secondPage() {
    return FilterPage();
  }
  Widget lastPage(var recipes) {
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
}
