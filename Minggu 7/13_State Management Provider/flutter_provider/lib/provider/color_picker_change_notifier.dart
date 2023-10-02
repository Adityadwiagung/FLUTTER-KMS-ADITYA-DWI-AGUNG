import 'package:flutter/material.dart';

class ColorPickerChangeNotifier with ChangeNotifier{
    Color _currentColor = Colors.orange;
    Color get currentColor => _currentColor;

    set currentColor(Color newColor) {
    _currentColor = newColor;
    notifyListeners(); 
  }
    
}