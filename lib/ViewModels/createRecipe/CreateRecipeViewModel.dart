import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yesilsepet/Models/recipe_model.dart';

class CreateRecipeViewModel extends ChangeNotifier {
  List<String> malzemeler = ["soğan", "yağ", "su", "domates"];
  int currentStep = 0;
  final PageController pageController = PageController();

  List<String> getMalzemeler() {
    return malzemeler;
  }

  void addMalzeme(String newMalzeme) {
    malzemeler.add(newMalzeme);
    notifyListeners();
  }

  void removeMalzeme(String malzeme) {
    malzemeler.remove(malzeme);
    notifyListeners();
  }

  void nextStep() {
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

  List<RecipeModel> getRecipes(){
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