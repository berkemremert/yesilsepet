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
              const SizedBox(height: 40),
              Padding(
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
              ),

            ],
          ),

        ],
      ),
    );
  }
}
