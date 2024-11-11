import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';
import '../../../ViewModels/createRecipe/CreateRecipeViewModel.dart';

class NewIngredientSearchBar extends StatelessWidget {
  const NewIngredientSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CreateRecipeViewModel>(context, listen: false);
    final TextEditingController _textFieldController = TextEditingController();

    void addIngredient() {
      final text = _textFieldController.text;
      if (text.isNotEmpty) {
        _textFieldController.clear();
        viewModel.addMalzeme(text);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.pureWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _textFieldController,
                onSubmitted: (_) => addIngredient(),
                decoration: InputDecoration(
                  hintText: 'Elinizdeki malzemeleri giriniz...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: addIngredient,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.coralOrange,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Ekle',
              style: TextStyle(
                color: AppColors.pureWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}