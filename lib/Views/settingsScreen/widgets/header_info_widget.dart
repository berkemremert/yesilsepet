import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/appColors.dart';

class HeaderInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20,),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.location_on,
            color: Colors.grey[700],
            size: 36.0,
          ),
        ),
        const SizedBox(width: 15,),
        const SizedBox(
          width: 120,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Berk Emre Mert', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              'Koç University Main Campus Rumelifeneri Campus Mai Center',
              style: TextStyle(fontSize: 10, color: AppColors.lightBlack),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text('+90 533 479 1252', style: TextStyle(fontSize: 10, color: AppColors.lightGray),),
          ],
        ),),
        Spacer(),
        Container(
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_upward,
            color: Colors.grey[700],
            size: 12.0,
          ),
        ),
        SizedBox(width: 15,),
      ],
    );
  }
}
