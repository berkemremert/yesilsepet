import 'package:flutter/material.dart';

import '../ingredient_list.dart';
import '../new_ingredients_search_bar.dart';

Widget FirstPage(){
  return const Column(
    children: [
      SizedBox(height: 10),
      NewIngredientSearchBar(),
      SizedBox(height: 10),
      IngredientList(),
    ],
  );
}