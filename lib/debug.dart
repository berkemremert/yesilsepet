import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesilsepet/ViewModels/DashboardPage/RecipeViewModel.dart';
import 'package:yesilsepet/Views/dashboardPage/DashboardPage.dart';
import 'package:yesilsepet/Views/mainPage/main-page.dart';
import 'package:yesilsepet/Views/settingsScreen/accountPage.dart';
import 'ViewModels/WelcomePage/WelcomeViewModel.dart';
import 'ViewModels/mainPage/MainViewModel.dart';
import 'ViewModels/settingsScreen/accountViewModel.dart';
import 'Views/welcomePage/WelcomePage.dart';
import 'package:yesilsepet/Views/settingsScreen/addressPage.dart';

class DebugPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Debug Page'),
      ),
      body: Center(
          child: Column(
            children: [
              ElevatedButton( // Welcome Page
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (_) => WelcomeViewModel(),
                        child: WelcomePage(),
                      ),
                    ),
                  );
                },
                child: Text('Go to Welcome Page'),
              ),
              ElevatedButton( // Home Page
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (_) => MainViewModel(),
                        child: MainPage(),
                      ),
                    ),
                  );
                },
                child: Text('Go to Home Page'),
              ),
              ElevatedButton( // Dashboard Page
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (_) => DashboardViewModel(),
                        child: DashboardPage(),
                      ),
                    ),
                  );
                },
                child: Text('Go to Dashboard page'),
              ),
              ElevatedButton( // Address Page
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddressPage(),
                    ),
                  );
                },
                child: Text('Go to Address page'),
              ),
              ElevatedButton( // Profile Page
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: const Text('Go to Profile'),
              ),

            ],
          )
      ),
    );
  }
}

//Welcoming TODO:
//overflow
//create account username, password necessities
//login username -> email (type as well)
//login password -> password (type)

//Dashboard TODO:
//theme match
//user name connect -> settings

//Settings TODO:
//mvvm fix
//main.dart update