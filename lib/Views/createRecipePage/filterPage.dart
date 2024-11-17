import 'package:flutter/material.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  // Avoided food filters
  bool isVegan = false;
  bool isVegetarian = false;
  bool isHalal = false;

  // Diet preferences
  bool isLowCalorie = false;
  bool isHighProtein = false;
  bool isLowCarb = false;

  // Meal preparation
  bool isQuickRecipe = false;
  bool isEasyRecipe = false;
  bool isGourmetMeal = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle("Avoided Food"),
            buildFilterCard([
              buildSwitchTile("Vegan", isVegan, (value) {
                setState(() {
                  isVegan = value;
                });
              }),
              buildSwitchTile("Vegetarian", isVegetarian, (value) {
                setState(() {
                  isVegetarian = value;
                });
              }),
              buildSwitchTile("Halal", isHalal, (value) {
                setState(() {
                  isHalal = value;
                });
              }),
            ]),
            const SizedBox(height: 16),
            buildSectionTitle("Diet Preferences"),
            buildFilterCard([
              buildSwitchTile("Low Calorie", isLowCalorie, (value) {
                setState(() {
                  isLowCalorie = value;
                });
              }),
              buildSwitchTile("High Protein", isHighProtein, (value) {
                setState(() {
                  isHighProtein = value;
                });
              }),
              buildSwitchTile("Low Carb", isLowCarb, (value) {
                setState(() {
                  isLowCarb = value;
                });
              }),
            ]),
            const SizedBox(height: 16),
            buildSectionTitle("Meal Preparation"),
            buildFilterCard([
              buildSwitchTile("Quick Recipe", isQuickRecipe, (value) {
                setState(() {
                  isQuickRecipe = value;
                });
              }),
              buildSwitchTile("Easy Recipe", isEasyRecipe, (value) {
                setState(() {
                  isEasyRecipe = value;
                });
              }),
              buildSwitchTile("Gourmet Meal", isGourmetMeal, (value) {
                setState(() {
                  isGourmetMeal = value;
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
      // activeTrackColor: AppColors.green,
      // inactiveThumbColor: AppColors.verylightGray,
      // inactiveTrackColor: AppColors.lightGray,
    );
  }
}