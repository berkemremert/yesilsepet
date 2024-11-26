import 'package:flutter/material.dart';

class CurrentRecipe {
  static final CurrentRecipe _instance = CurrentRecipe._internal();

  CurrentRecipe._internal();

  factory CurrentRecipe() {
    return _instance;
  }

  String? name;
  String? description;
  List<String> ingredients = [];
  Map<String, dynamic> preferences = {};

  void setName(String newName) {
    name = newName;
  }

  void setDescription(String newDescription) {
    description = newDescription;
  }

  void setIngredients(List<String> newIngredients) {
    ingredients = newIngredients;
  }

  void setPreferences(Map<String, dynamic> newPreferences) {
    preferences = newPreferences;
  }

  void clear() {
    name = null;
    description = null;
    ingredients.clear();
    preferences.clear();
  }

  String toString(){
    return "\nINGREDIENTS: " + ingredients.toString() + "\nPREFERENCES: " + preferences.toString();
  }
}