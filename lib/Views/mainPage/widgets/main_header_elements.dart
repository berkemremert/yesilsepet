import 'package:flutter/material.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';

class MainHeaderElements extends StatefulWidget {
  const MainHeaderElements({super.key});

  @override
  State<MainHeaderElements> createState() => _MainHeaderElementsState();
}

class _MainHeaderElementsState extends State<MainHeaderElements> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              print("hahahah");
            },
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/default_profile_picture.webp'),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Yeşil Tarif',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.pureWhite,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              print('hahahahha');
            },
          ),
        ],
      ),
    );
  }
}
