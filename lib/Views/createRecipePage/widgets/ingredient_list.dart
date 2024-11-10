import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../ViewModels/createRecipe/CreateRecipeViewModel.dart';

class IngredientList extends StatelessWidget {
  const IngredientList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CreateRecipeViewModel>(context);

    return Container(
      height: 260,
      width: 350,
      child: ListView.builder(
        itemCount: viewModel.malzemeler.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListTile(
                title: Text(
                  viewModel.malzemeler[index],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.cancel, color: Colors.red),
                  onPressed: () {
                    viewModel.removeMalzeme(viewModel.malzemeler[index]);
                  },
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                dense: true,
              ),
            ),
          );
        },
      ),
    );
  }
}