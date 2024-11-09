import 'package:flutter/material.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';

class TarifCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isHealthy;
  final bool isExpensive;

  TarifCard({
    required this.title,
    required this.description,
    required this.isHealthy,
    required this.isExpensive,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                if (isHealthy) Icon(Icons.health_and_safety, color: Colors.green),
                if (isExpensive) Icon(Icons.money, color: Colors.red),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              description.length > 50 ? description.substring(0, 150) + '...' : description,
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                print('lksfşlkşsdlfklşs'); // TODO: IMPLEMENT HERE
              },
              child: Text(
                'Detaylar...',
                style: TextStyle(
                  color: AppColors.oliveGreen,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}