import 'package:flutter/material.dart';
import 'package:proje/theme/theme_constants.dart';



class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme;

 ThemeProvider() : _currentTheme = lightTheme;


  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme = (_currentTheme == lightTheme) ? darkTheme : lightTheme;
    notifyListeners();
  }

  ThemeMode get themeMode {
    return (_currentTheme == darkTheme) ? ThemeMode.dark : ThemeMode.light;
  }
}



