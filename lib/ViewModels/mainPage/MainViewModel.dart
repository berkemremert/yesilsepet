import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {

  void openDrawer(GlobalKey<ScaffoldState> scaffoldKey) {
    scaffoldKey.currentState?.openDrawer();
  }
}