import 'package:flutter/material.dart';
import 'package:yesilsepet/Views/mainPage/widgets/main_header_elements.dart';
import 'package:yesilsepet/Views/mainPage/widgets/main_header_wave.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';

import 'widgets/tarif_blocks.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    double greenBarHeight = 140.0;

    return Scaffold(
      backgroundColor: AppColors.warmWhite,
      body: Stack(
        children: [
          MainHeaderWave(greenBarHeight: greenBarHeight),
          Column(
            children: [
              const SizedBox(height: 30),
              MainHeaderElements(),
              Column(
                children: [
                  Container(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Tarif arat...',
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
                  Container(height: 30),
                  TarifCard(
                    title: 'Deluxe Vegan Tarif',
                    description: 'This is a premium vegan tarif designed for those who are looking for a healthy, yet flavorful alternative to traditional dishes. Packed with organic ingredients, and rich in plant-based proteins, this tarif ensures that your dietary needs are met without compromising taste. It’s an ideal choice for anyone who cares about sustainability and a balanced lifestyle.',
                    isHealthy: true,
                    isExpensive: true,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
