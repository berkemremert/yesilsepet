import 'package:flutter/material.dart';

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
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [AppColors.green, AppColors.limeGreen]),
              ),
              child: Text(
                'Profile Menu',
                style: TextStyle(color: AppColors.pureWhite, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                // TODO: Add profile navigation here
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                // TODO: Add profile navigation here
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                // TODO: Add profile navigation here
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                // TODO: Add profile navigation here
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                // Add profile navigation here
              },
            ),
            const Divider(color: AppColors.oliveGreen),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Add settings navigation here
              },
            ),
            ListTile(
              leading: Icon(Icons.emoji_food_beverage),
              title: Text('Hakkımızda'),
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