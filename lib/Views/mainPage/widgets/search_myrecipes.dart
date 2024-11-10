import 'package:flutter/material.dart';

import '../../theme/appColors.dart';

class SearchMyrecipes extends StatefulWidget {
  const SearchMyrecipes({super.key});

  @override
  State<SearchMyrecipes> createState() => _SearchMyrecipesState();
}

class _SearchMyrecipesState extends State<SearchMyrecipes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Tariflerimde ara...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: AppColors.lightGray),
          ),
          prefixIcon: Icon(Icons.filter_alt, color: AppColors.black),
          suffixIcon: Icon(Icons.search, color: AppColors.black),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        ),
      ),
    );
  }
}
