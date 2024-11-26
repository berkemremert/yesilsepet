import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yesilsepet/Models/recipe_model.dart';

class DashboardViewModel extends ChangeNotifier{
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
      RecipeModel(
        title: 'Caesar Salad',
        imagePath: 'https://domf5oio6qrcr.cloudfront.net/medialibrary/9545/conversions/healthy-superfoods-thumb.jpg',
        badges: [
          FontAwesomeIcons.heart,
          FontAwesomeIcons.leaf,
          FontAwesomeIcons.cheese,
        ],
      ),
      RecipeModel(
        title: 'Sushi Rolls',
        imagePath: 'https://hips.hearstapps.com/hmg-prod/images/heart-healthy-food-1580231690.jpg',
        badges: [
          FontAwesomeIcons.fish,
          FontAwesomeIcons.heart,
          FontAwesomeIcons.coffee,
        ],
      ),
      RecipeModel(
        title: 'Apple Pie',
        imagePath: 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2013/2/14/0/FNK_Herbed-Chicken-Marsala_s4x3.jpg.rend.hgtvcom.1280.960.suffix/1371614296995.jpeg',
        badges: [
          FontAwesomeIcons.apple,
          FontAwesomeIcons.affiliatetheme,
          FontAwesomeIcons.heart,
        ],
      ),
    ];
  }
}
