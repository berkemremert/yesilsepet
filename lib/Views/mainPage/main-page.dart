import 'package:flutter/material.dart';
import 'package:yesilsepet/Views/mainPage/widgets/category_slider.dart';
import 'package:yesilsepet/Views/mainPage/widgets/main_header_elements.dart';
import 'package:yesilsepet/Views/mainPage/widgets/main_header_wave.dart';
import 'package:yesilsepet/Views/mainPage/widgets/tarif_main_button.dart';
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
              CategorySlider(),
              Expanded(
                child: SingleChildScrollView(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                      childAspectRatio: 0.6,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return TarifCard(
                        title: 'Gourmet Plant-Based Tarif ${index + 1}',
                        description: 'This gourmet tarif is a luxurious combination of plant-based ingredients, offering a refined taste experience. Ideal for those looking to indulge in a sophisticated yet healthy dish.',
                        isHealthy: true,
                        isExpensive: true,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),

          const Positioned(
            bottom: 16,
            right: 16,
            child: TarifMainButton(),
          ),
        ],
      ),
    );
  }
}