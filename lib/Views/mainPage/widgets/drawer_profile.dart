import 'package:flutter/material.dart';

import '../../settingsScreen/addressPage.dart';
import '../../theme/appColors.dart';

class DrawerProfile extends StatefulWidget {
  const DrawerProfile({super.key});

  @override
  State<DrawerProfile> createState() => _DrawerProfileState();
}

class _DrawerProfileState extends State<DrawerProfile> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.offWhite,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [AppColors.green, AppColors.limeGreen]),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.limeGreen, width: 1),
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/adam.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                      "Berk Emre Mert",
                    style: TextStyle(color: AppColors.pureWhite),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('About me'),
              onTap: () {
                // TODO: Add profile navigation here
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_basket),
              title: Text('My Orders'),
              onTap: () {
                // TODO: Add profile navigation here
              },
            ),
            ListTile(
              leading: Icon(Icons.location_pin),
              title: Text('My Address'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddressPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Credit Cards'),
              onTap: () {
                // TODO: Add profile navigation here
              },
            ),
            const Divider(color: AppColors.oliveGreen),
            ListTile(
              leading: Icon(Icons.emoji_food_beverage),
              title: Text('Hakkımızda'),
              onTap: () {
                // Add settings navigation here
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign Out'),
              onTap: () {
                // Add settings navigation here
              },
            ),
          ],
        ),
      ),
    );
  }
}