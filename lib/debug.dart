import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:provider/provider.dart';
import 'ViewModels/WelcomePage/WelcomeViewModel.dart';
import 'Views/welcomePage/WelcomePage.dart';
=======
import 'package:yesilsepet/main-page.dart';
import 'package:yesilsepet/main.dart';
>>>>>>> Stashed changes

class DebugPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Debug Page'),
      ),
<<<<<<< Updated upstream
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
              //   DENİZ BURAYAA YAZZZZ
              },
              child: Text('Go to Welcome Page'),
            ),
          ],
        )
=======
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ),
              );
            },
            child: Text('Home'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(title: "bok",),
                ),
              );
            },
            child: Text('Login'),
          ),
        ],
>>>>>>> Stashed changes
      ),
    );
  }
}