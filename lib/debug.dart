import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesilsepet/main-page.dart';
import 'ViewModels/WelcomePage/WelcomeViewModel.dart';
import 'Views/welcomePage/WelcomePage.dart';

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
                      builder: (context) => MainPage()
                    ),
                  );
                },
                child: Text('Go to Home Page'),
              ),
            ],
          )
      ),
    );
  }
}