import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/ingredient_list.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/new_ingredients_search_bar.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/progressBar.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';
import '../../ViewModels/createRecipe/CreateRecipeViewModel.dart';

class IngredientsPage extends StatelessWidget {
  const IngredientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CreateRecipeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.green,
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
              ProgressBarSection(),
              SizedBox(height: 10),
              NewIngredientSearchBar(),
              SizedBox(height: 10),
              IngredientList(),
              Divider(color: AppColors.oliveGreen),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.coralOrange,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  onPressed: (){
                    // TODO: IMPLEMENT
                  },
                  child: Text(
                      "İleri",
                    style: TextStyle(
                      color: AppColors.pureWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}