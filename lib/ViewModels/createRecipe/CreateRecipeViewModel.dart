import 'package:flutter/material.dart';

class CreateRecipeViewModel extends ChangeNotifier {
  //functions here
  List<String> malzemeler = ["soğan", "yağ", "su", "domates"];

  List<String> getMalzemeler(){
    return malzemeler;
  }
  void addMalzeme(String newMalzeme){
    malzemeler.add(newMalzeme);
    notifyListeners();
  }
  void removeMalzeme(String malzeme) {
    malzemeler.remove(malzeme);
    notifyListeners();
  }
}