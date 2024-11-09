import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesilsepet/ViewModels/recipeDetail/RecipeViewModel.dart';
import 'package:yesilsepet/Views/recipeDetailPage/recipe_detail.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';

class TarifCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isHealthy;
  final bool isExpensive;

  TarifCard({
    required this.title,
    required this.description,
    required this.isHealthy,
    required this.isExpensive,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (_) => RecipeViewModel(),
              child: RecipeDetail(),
            ),
          ),
        );
      },
      child: Card(
        color: AppColors.pureWhite,
        elevation: 4.0,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  'assets/grocery.jpeg', // Placeholder image
                  height: 120.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                title,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isHealthy) Icon(Icons.health_and_safety, color: AppColors.black),
                  if (isExpensive) Icon(Icons.money, color: AppColors.black),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}