import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on, color: Colors.grey[700]),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Address'),
            Text('Phone Number'),
          ],
        ),
      ],
    );
  }
}
