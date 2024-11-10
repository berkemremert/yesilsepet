import 'package:flutter/material.dart';
import 'package:yesilsepet/Views/createRecipePage/widgets/new_ingredients_search_bar.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';

class IngredientsPage extends StatefulWidget {
  const IngredientsPage({super.key});

  @override
  State<IngredientsPage> createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
  double progress = 0.5; // Progress bar value, can be updated dynamically
  TextEditingController textController = TextEditingController(); // Controller for text input

  // Function to increment progress
  void _incrementProgress() {
    setState(() {
      if (progress < 1.0) {
        progress += 0.1; // Increment by 10% per click
      }
    });
  }

  // Function to decrement progress
  void _decrementProgress() {
    setState(() {
      if (progress > 0.0) {
        progress -= 0.1; // Decrement by 10% per click
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pureWhite,
        title: const Text(
          "Tarif Oluştur!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: AppColors.offWhite,
      body: Column(
        children: [
          // Animated progress bar at the top
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: progress, end: progress),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  value: value, // Animated progress value (between 0.0 and 1.0)
                  backgroundColor: AppColors.lightGray,
                  color: AppColors.green, // Change this to your desired color
                );
              },
            ),
          ),

          // Buttons to increment and decrement progress
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove_circle_outline, color: AppColors.green),
                onPressed: _decrementProgress, // Decrease progress
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: Icon(Icons.add_circle_outline, color: AppColors.green),
                onPressed: _incrementProgress, // Increase progress
              ),
            ],
          ),
          const SizedBox(height: 10),
          NewIngredientSearchBar(),
        ],
      ),
    );
  }
}