import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../ViewModels/createRecipe/CreateRecipeViewModel.dart';
import '../../theme/appColors.dart';

class ProgressBarSection extends StatelessWidget {
  const ProgressBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    double progress = 0.5; // Static for now; modify to be dynamic if needed.

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: progress, end: progress),
            duration: const Duration(milliseconds: 500),
            builder: (context, value, child) {
              return LinearProgressIndicator(
                value: value,
                minHeight: 8,
                borderRadius: BorderRadius.circular(10),
                backgroundColor: AppColors.lightGray,
                color: AppColors.scarletOrange,
              );
            },
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     IconButton(
        //       icon: Icon(Icons.remove_circle_outline, color: AppColors.green),
        //       onPressed: () {},
        //     ),
        //     const SizedBox(width: 20),
        //     IconButton(
        //       icon: Icon(Icons.add_circle_outline, color: AppColors.green),
        //       onPressed: () {
        //         // Retrieve the view model and print the current malzemeler list
        //         final viewModel = Provider.of<CreateRecipeViewModel>(context, listen: false);
        //         print(viewModel.malzemeler);
        //       },
        //     ),
        //   ],
        // ),
      ],
    );
  }
}