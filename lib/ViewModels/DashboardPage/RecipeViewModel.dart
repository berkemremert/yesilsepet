import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yesilsepet/Models/recipe_model.dart';
class RecipeViewModel extends ChangeNotifier{
  List<RecipeModel> getRecipes() {
    return [
      RecipeModel(title: 'Elma Tarif', imagePath: 'assets/images/apple.webp', badges: ['badge1', 'badge2']),
      RecipeModel(title: 'Brokoli Tarif', imagePath: 'assets/images/broccoli.png', badges: ['badge3']),
      RecipeModel(title: 'Elma Tarif', imagePath: 'assets/images/apple.webp', badges: ['badge1', 'badge2']),
      RecipeModel(title: 'Brokoli Tarif', imagePath: 'assets/images/broccoli.png', badges: ['badge3']),
    ];
  }
}
