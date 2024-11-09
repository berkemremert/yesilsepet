import 'package:flutter/material.dart';
import 'package:yesilsepet/main.dart';

class DebugPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Debug Page'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(title: "bok",),
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
      ),
    );
  }
}
