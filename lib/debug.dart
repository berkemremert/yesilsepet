import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesilsepet/ViewModels/DashboardPage/RecipeViewModel.dart';
import 'package:yesilsepet/Views/dashboardPage/DashboardPage.dart';
import 'package:yesilsepet/Views/mainPage/main-page.dart';
import 'ViewModels/WelcomePage/WelcomeViewModel.dart';
import 'ViewModels/mainPage/MainViewModel.dart';
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
              ElevatedButton(
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
              ElevatedButton(
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
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (_) => RecipeViewModel(),
                        child: DashboardPage(),
                      ),
                    ),
                  );
                },
                child: Text('Go to Dashboard page'),
              ),
              ElevatedButton(
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
            ],
          )
      ),
    );
  }
}