import 'package:flutter/material.dart';
import '../mainPage/widgets/main_header_elements.dart';
import '../mainPage/widgets/main_header_wave.dart';
import '../theme/appColors.dart';

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({super.key});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  // Placeholder categories with icons
  final List<Map<String, dynamic>> placeholderCategories = [
    {'label': 'Sustainable', 'icon': Icons.eco},
    {'label': 'Vegan', 'icon': Icons.energy_savings_leaf},
    {'label': 'Low Carb', 'icon': Icons.fastfood},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: Stack(
        children: [
          MainHeaderWave(),
          Column(
            children: [
              const SizedBox(height: 30),
              MainHeaderElements(),
              const SizedBox(height: 70),
              Column(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      'assets/grocery.jpeg',
                      height: 250.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Recipe Name',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'This is a short summary of the recipe. It contains the essential steps, ingredients, and other relevant information.',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: AppColors.black.withOpacity(0.7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Display smaller categories with icons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Wrap(
                      spacing: 10.0,
                      children: placeholderCategories.map((category) {
                        return GestureDetector(
                          onTap: () {
                            // Add functionality to handle category tap if needed
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 6.0),
                            padding: const EdgeInsets.all(6.0), // Reduced padding
                            decoration: BoxDecoration(
                              color: AppColors.pureWhite,
                              borderRadius: BorderRadius.circular(8), // Smaller radius
                              border: Border.all(
                                color: AppColors.green,
                                width: 1.5, // Smaller border width
                              ),
                              boxShadow: [
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
                                  category['icon'],
                                  size: 20, // Smaller icon size
                                  color: AppColors.green,
                                ),
                                const SizedBox(height: 4), // Reduced space between icon and label
                                Text(
                                  category['label'],
                                  style: TextStyle(
                                    color: AppColors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10, // Smaller font size
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.limeGreen, AppColors.green],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        print('şlsdkflşsdkflşs');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 30.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Start Recipe',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.pureWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}