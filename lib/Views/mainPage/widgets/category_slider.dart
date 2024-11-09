import 'package:flutter/material.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';

class CategorySlider extends StatefulWidget {
  const CategorySlider({super.key});

  @override
  State<CategorySlider> createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  List<int> selectedIndices = [];

  // List of categories and their icons
  final List<Map<String, dynamic>> categories = [ // TODO: Edit these accordingly
    {'label': 'Sustainable', 'icon': Icons.eco},
    {'label': 'High Calorie', 'icon': Icons.local_dining},
    {'label': 'Low Carb', 'icon': Icons.fastfood},
    {'label': 'Vegan', 'icon': Icons.energy_savings_leaf},
    {'label': 'Gluten-Free', 'icon': Icons.cancel_presentation},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
              (index) => GestureDetector(
            onTap: () {
              setState(() {
                // Toggle the selection status of the tapped category
                if (selectedIndices.contains(index)) {
                  selectedIndices.remove(index);
                } else {
                  selectedIndices.add(index);
                }
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 6.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: selectedIndices.contains(index)
                    ? AppColors.coralOrange
                    : AppColors.verylightGray,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  if (selectedIndices.contains(index))
                    const BoxShadow(
                      color: AppColors.lightGray,
                      spreadRadius: 1,
                      blurRadius: 4,
                    ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    categories[index]['icon'],
                    size: 24,
                    color: selectedIndices.contains(index)
                        ? AppColors.pureWhite
                        : AppColors.black,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    categories[index]['label'],
                    style: TextStyle(
                      color: selectedIndices.contains(index)
                          ? AppColors.pureWhite
                          : AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}