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
      color: AppColors.pureWhite,
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center the content horizontally
          children: [
            // Placeholder image with shaved corners
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0), // Set the border radius for rounded corners
              child: Image.asset(
                'assets/grocery.jpeg', // Your placeholder image path
                height: 120.0, // Set the height of the image
                fit: BoxFit.cover, // Make sure the image covers the space
              ),
            ),
            SizedBox(height: 10.0),
            // Title with smaller font size
            Text(
              title,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), // Smaller font size
              textAlign: TextAlign.center, // Center align the title text
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the row content
              children: [
                if (isHealthy) Icon(Icons.health_and_safety, color: Colors.green),
                if (isExpensive) Icon(Icons.money, color: Colors.red),
              ],
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                print('odfkslf');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.oliveGreen,
                foregroundColor: AppColors.pureWhite,
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'View Details',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}