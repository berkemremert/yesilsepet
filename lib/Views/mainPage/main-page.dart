import 'package:flutter/material.dart';
import 'package:yesilsepet/ViewModels/mainPage/MainViewModel.dart';
import 'package:yesilsepet/Views/mainPage/widgets/category_slider.dart';
import 'package:yesilsepet/Views/mainPage/widgets/drawer_profile.dart';
import 'package:yesilsepet/Views/mainPage/widgets/main_header_elements.dart';
import 'package:yesilsepet/Views/helper_widgets/main_header_wave.dart';
import 'package:yesilsepet/Views/mainPage/widgets/search_myrecipes.dart';
import 'package:yesilsepet/Views/mainPage/widgets/tarif_main_button.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';
import 'widgets/tarif_blocks.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final MainViewModel viewModel = MainViewModel();

  void openDrawer() {
    viewModel.openDrawer(_scaffoldKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.offWhite,
      drawer: const DrawerProfile(),
      body: Stack(
        children: [
          const MainHeaderWave(
            startColor: AppColors.coralOrangeDark,
            endColor: AppColors.coralOrange,
          ),
          Column(
            children: [
              const SizedBox(height: 30),
              MainHeaderElements(openDrawer: openDrawer),
              const SizedBox(height: 40),
              const SearchMyrecipes(),
              const CategorySlider(),
              Expanded(
                child: SingleChildScrollView(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                      childAspectRatio: 0.7,
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