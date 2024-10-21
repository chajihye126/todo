import 'package:flutter/cupertino.dart';

class MainTabViewModel extends ChangeNotifier {
  int bottomNavCurrentIndex = 0;

  void bottomNavOnTap(int index) {
    bottomNavCurrentIndex = index;
    notifyListeners();
  }
}