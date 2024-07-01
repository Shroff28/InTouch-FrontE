import 'package:flutter/material.dart';

class BottomTabBarProvider extends ChangeNotifier {
  int _currentIndex = 2;
  int _activeIndex = 1;
  bool _isAdded = false;

  int get currentIndex {
    return _currentIndex;
  }

  int get activeIndex {
    return _activeIndex;
  }

  bool get isImageAdded {
    return _isAdded;
  }

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setActiveIndex(int index) {
    _activeIndex = index;
    notifyListeners();
  }

  void imageAdded(bool isAdded) {
    _isAdded = isAdded;
    notifyListeners();
  }

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void clearAllData() {
    _currentIndex = 0;
    notifyListeners();
  }

  void clearActiveData() {
    _activeIndex = 1;
    notifyListeners();
  }
}
