import 'package:flutter/material.dart';

class CategorySlider extends StatefulWidget {
  const CategorySlider({super.key});

  @override
  State<CategorySlider> createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  // Track the selected indices for categories
  List<int> selectedIndices = [];

  // List of categories and their icons
  final List<Map<String, dynamic>> categories = [
    {'label': 'Sustainable', 'icon': Icons.eco},
    {'label': 'High Calorie', 'icon': Icons.local_dining},
    {'label': 'Low Carb', 'icon': Icons.fastfood},
    {'label': 'Vegan', 'icon': Icons.energy_savings_leaf},
    {'label': 'Gluten-Free', 'icon': Icons.cancel_presentation},
  ];

  @override
  Widget build(BuildContext context) {
    // Reorder categories so selected ones come first
    List<Map<String, dynamic>> reorderedCategories = [];
    for (var i = 0; i < categories.length; i++) {
      if (selectedIndices.contains(i)) {
        reorderedCategories.add(categories[i]);
      }
    }
    for (var i = 0; i < categories.length; i++) {
      if (!selectedIndices.contains(i)) {
        reorderedCategories.add(categories[i]);
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          reorderedCategories.length,
              (index) => GestureDetector(
            onTap: () {
              setState(() {
                int originalIndex = categories.indexOf(reorderedCategories[index]);
                if (selectedIndices.contains(originalIndex)) {
                  selectedIndices.remove(originalIndex); // Deselect
                } else {
                  selectedIndices.add(originalIndex); // Select
                }
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),  // Smooth transition for changes
              margin: const EdgeInsets.symmetric(horizontal: 6.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: selectedIndices.contains(categories.indexOf(reorderedCategories[index]))
                    ? Colors.green
                    : Colors.grey[200],  // Change color when selected
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  if (selectedIndices.contains(categories.indexOf(reorderedCategories[index])))
                    BoxShadow(
                      color: Colors.green.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 4,  // Reduced blur radius
                    ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    reorderedCategories[index]['icon'],
                    size: 24,
                    color: selectedIndices.contains(categories.indexOf(reorderedCategories[index]))
                        ? Colors.white
                        : Colors.black,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    reorderedCategories[index]['label'],
                    style: TextStyle(
                      color: selectedIndices.contains(categories.indexOf(reorderedCategories[index]))
                          ? Colors.white
                          : Colors.black,
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