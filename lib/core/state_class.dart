import 'package:flutter/material.dart';

class StateClass with ChangeNotifier {
  bool isLoading = false;
  bool isMinorLoading = false;

  loadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  loadingFalse() {
    isLoading = false;
    notifyListeners();
  }
}
