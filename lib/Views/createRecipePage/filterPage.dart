import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';

import '../../ViewModels/createRecipe/CreateRecipeViewModel.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    // Access the ViewModel
    final viewModel = Provider.of<CreateRecipeViewModel>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle("Avoided Food"),
            buildFilterCard([
              buildSwitchTile("Vegan", viewModel.isVegan, (value) {
                setState(() {
                  viewModel.isVegan = value;
                  viewModel.setPreference("Vegan", value);
                });
              }),
              buildSwitchTile("Vegetarian", viewModel.isVegetarian, (value) {
                setState(() {
                  viewModel.isVegetarian = value;
                  viewModel.setPreference("Vegetarian", value);
                });
              }),
              buildSwitchTile("Halal", viewModel.isHalal, (value) {
                setState(() {
                  viewModel.isHalal = value;
                  viewModel.setPreference("Halal", value);
                });
              }),
            ]),
            const SizedBox(height: 16),
            buildSectionTitle("Diet Preferences"),
            buildFilterCard([
              buildSwitchTile("Low Calorie", viewModel.isLowCalorie, (value) {
                setState(() {
                  viewModel.isLowCalorie = value;
                  viewModel.setPreference("Low Calorie", value);
                });
              }),
              buildSwitchTile("High Protein", viewModel.isHighProtein, (value) {
                setState(() {
                  viewModel.isHighProtein = value;
                  viewModel.setPreference("High Protein", value);
                });
              }),
              buildSwitchTile("Low Carb", viewModel.isLowCarb, (value) {
                setState(() {
                  viewModel.isLowCarb = value;
                  viewModel.setPreference("Low Carb", value);
                });
              }),
            ]),
            const SizedBox(height: 16),
            buildSectionTitle("Meal Preparation"),
            buildFilterCard([
              buildSwitchTile("Quick Recipe", viewModel.isQuickRecipe, (value) {
                setState(() {
                  viewModel.isQuickRecipe = value;
                  viewModel.setPreference("Quick Recipe", value);
                });
              }),
              buildSwitchTile("Easy Recipe", viewModel.isEasyRecipe, (value) {
                setState(() {
                  viewModel.isEasyRecipe = value;
                  viewModel.setPreference("Easy Recipe", value);
                });
              }),
              buildSwitchTile("Gourmet Meal", viewModel.isGourmetMeal, (value) {
                setState(() {
                  viewModel.isGourmetMeal = value;
                  viewModel.setPreference("Gourmet Meal", value);
                });
              }),
            ]),
          ],
        ),
      ),
    );
  }

  // Helper method for section titles
  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.green,
        ),
      ),
    );
  }

  // Helper method to build a filter card
  Widget buildFilterCard(List<Widget> children) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  // Helper method to build a switch tile
  Widget buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      value: value,
      onChanged: onChanged,
      activeColor: AppColors.green,
    );
  }
}