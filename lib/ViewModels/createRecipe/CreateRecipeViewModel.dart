import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yesilsepet/Models/recipe_model.dart';
import 'package:yesilsepet/Services/geminiService.dart';
import 'package:yesilsepet/current_recipe.dart';

class CreateRecipeViewModel extends ChangeNotifier {
  List<String> malzemeler = ["soğan", "yağ", "su", "domates"];
  int currentStep = 0;
  final PageController pageController = PageController();

  bool isVegan = false;
  bool isVegetarian = false;
  bool isHalal = false;
  bool isLowCalorie = false;
  bool isHighProtein = false;
  bool isLowCarb = false;
  bool isQuickRecipe = false;
  bool isEasyRecipe = false;
  bool isGourmetMeal = false;

  List<String> getMalzemeler() => malzemeler;

  void addMalzeme(String newMalzeme) {
    malzemeler.add(newMalzeme);
    notifyListeners();
  }

  void removeMalzeme(String malzeme) {
    malzemeler.remove(malzeme);
    notifyListeners();
  }

  void refreshMalzemeInfo() {
    CurrentRecipe().setIngredients(malzemeler);
  }

  void setPreference(String preference, bool value) {
    switch (preference) {
      case "Vegan":
        isVegan = value;
        break;
      case "Vegetarian":
        isVegetarian = value;
        break;
      case "Halal":
        isHalal = value;
        break;
      case "Low Calorie":
        isLowCalorie = value;
        break;
      case "High Protein":
        isHighProtein = value;
        break;
      case "Low Carb":
        isLowCarb = value;
        break;
      case "Quick Recipe":
        isQuickRecipe = value;
        break;
      case "Easy Recipe":
        isEasyRecipe = value;
        break;
      case "Gourmet Meal":
        isGourmetMeal = value;
        break;
      default:
        break;
    }
    notifyListeners();
  }

  void refreshPreferences() {
    CurrentRecipe().setPreferences({
      "Vegan": isVegan,
      "Vegetarian": isVegetarian,
      "Halal": isHalal,
      "Low Calorie": isLowCalorie,
      "High Protein": isHighProtein,
      "Low Carb": isLowCarb,
      "Quick Recipe": isQuickRecipe,
      "Easy Recipe": isEasyRecipe,
      "Gourmet Meal": isGourmetMeal,
    });
  }

  void nextStep() {
    if (currentStep == 0) {
      refreshMalzemeInfo();
      print(CurrentRecipe().ingredients);
    }
    if (currentStep == 1) {
      refreshPreferences();
      // print(CurrentRecipe().preferences);
      print(CurrentRecipe().toString());
      // print(giveGeminiData());
      // var recipe = giveGeminiData();
    }
    if (currentStep < 2) {
      currentStep++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  Future<String> getNewRecipe(){
    return giveGeminiData();
  }

  List<RecipeModel> getRecipes() {
    return [
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
  }
}