import 'package:flutter/material.dart';

import 'appColors.dart';

PreferredSizeWidget? CustomAppBar(){
  return AppBar(
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[AppColors.green, AppColors.limeGreen]),
      ),
    ),
    title: const Text(
      "Tarif Oluştur!",
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
