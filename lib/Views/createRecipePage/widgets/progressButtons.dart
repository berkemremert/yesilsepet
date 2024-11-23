import 'package:flutter/material.dart';
import 'package:yesilsepet/ViewModels/createRecipe/CreateRecipeViewModel.dart';

import '../../theme/appColors.dart';

Widget ProgressButtons(CreateRecipeViewModel viewModel){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (viewModel.currentStep > 0)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.verylightGray,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: viewModel.previousStep,
            child: const Text(
              "Geri",
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        if (viewModel.currentStep < 2)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.coralOrange,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: viewModel.nextStep,
            child: Text(
              viewModel.currentStep == 1 ? "Oluştur" : "İleri",
              style: const TextStyle(
                color: AppColors.pureWhite,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
      ],
    ),
  );
}