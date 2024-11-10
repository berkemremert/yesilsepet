import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesilsepet/ViewModels/createRecipe/CreateRecipeViewModel.dart';
import 'package:yesilsepet/Views/createRecipePage/ingredientsPage.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';

class TarifMainButton extends StatefulWidget {
  const TarifMainButton({super.key});

  @override
  State<TarifMainButton> createState() => _TarifMainButtonState();
}

class _TarifMainButtonState extends State<TarifMainButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (_) => CreateRecipeViewModel(),
              child: IngredientsPage(),
            ),
          ),
        );
      },
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [
              AppColors.coralOrange,
              AppColors.coralOrangeDark,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.2),
              offset: const Offset(2, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: const Center(
          child: Icon(
              Icons.add,
            color: AppColors.pureWhite,
          ),
        ),
      ),
    );
  }
}