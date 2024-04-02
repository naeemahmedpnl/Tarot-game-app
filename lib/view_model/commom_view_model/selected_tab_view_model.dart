import 'package:flutter/material.dart';
import 'package:tarrot/data/network_service.dart';

class SelectedTabViewModel with ChangeNotifier {
  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  NetworkService networkService = NetworkService();

  void changeTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }
}
