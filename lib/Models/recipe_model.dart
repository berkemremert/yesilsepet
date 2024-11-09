import 'package:flutter/cupertino.dart';

class RecipeModel {
  final String title;
  final String imagePath;
  final List<IconData> badges;

  RecipeModel({
    required this.title,
    required this.imagePath,
    required this.badges,
  });
}