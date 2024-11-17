import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';
import '../../../ViewModels/createRecipe/CreateRecipeViewModel.dart';

class IngredientList extends StatelessWidget {
  const IngredientList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CreateRecipeViewModel>(context);

    return Container(
      height: 450,
      width: 370,
      child: ListView.builder(
        itemCount: viewModel.malzemeler.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.yellowGreen,
                  radius: 24, // Adjust radius for circle size
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/apple.webp', // Adjust the image as needed
                      width: 36,
                      height: 36,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  viewModel.malzemeler[index],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                dense: true,
                trailing: GestureDetector(
                  onTap: () {
                    viewModel.removeMalzeme(viewModel.malzemeler[index]);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('"${viewModel.malzemeler[index]}" removed'),
                      ),
                    );
                  },
                  child: Container(
                    height: double.infinity, // Matches the height of the ListTile
                    width: 48, // Ensures a square button with a fixed width
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(5), // Optional: adjust for rounded corners
                    ),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}