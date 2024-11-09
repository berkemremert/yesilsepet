import 'package:flutter/material.dart';

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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Green wavy bar behind the content
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: WavyClipper(),
              child: Container(
                color: Colors.green,
                height: greenBarHeight,
              ),
            ),
          ),
          // The content on top
          Column(
            children: [
              SizedBox(height: 30), // Space from the top
              Padding(
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
                            color: Colors.white,
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
              ),
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
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        prefixIcon: Icon(Icons.filter_alt, color: Colors.black),
                        suffixIcon: Icon(Icons.search, color: Colors.black),
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

class WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(size.width / 4, size.height, size.width / 2, size.height - 30);
    path.quadraticBezierTo(3 * size.width / 4, size.height - 60, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}