import 'dart:ui';

import 'package:flutter/material.dart';
import '../../theme/appColors.dart';

class ProfilePictureButton extends StatelessWidget {
  final double height;

  ProfilePictureButton({
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: height,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    color: Colors.white.withOpacity(0),
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.peachOrange.withOpacity(0.6),
                        AppColors.scarletOrange.withOpacity(0.6),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.pureWhite,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: height * 0.25 - 2,
                      backgroundImage: AssetImage('assets/default_profile_picture.webp'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 10),
                            Text(
                              "Sürpriz\nTarif",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.4),
                                    offset: Offset(2, 2),
                                    blurRadius: 16,
                                  ),
                                  Shadow(
                                    color: Colors.black.withOpacity(0.4),
                                    offset: Offset(0, 0),
                                    blurRadius: 120,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],),
              ),
            ],
          ),
        ),
      ),
    );
  }
}