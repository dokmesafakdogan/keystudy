import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFFE3EEFF),
  primary: const Color(0xFFE3EEFF),
  onPrimary: const Color(0xFF002359),
  secondary: const Color(0xFFE3EEFF),
  secondaryContainer: Colors.white,
);
var kDarkColorScheme = ColorScheme.fromSeed(
    primary: const Color(0xFF002359),
    seedColor: const Color(0xFF002359),
    secondary: const Color(0xFf02327D),
    onPrimary: Colors.white,
    secondaryContainer: const Color(0xFF002359));




  ThemeData darkTheme=  ThemeData(
              colorScheme: kDarkColorScheme,
              appBarTheme: const AppBarTheme(color: Color(0xFF02327D)),
              scaffoldBackgroundColor: const Color(0xFF002359),
              listTileTheme:
                  const ListTileThemeData().copyWith(textColor: Colors.white));
      ThemeData lightTheme =  ThemeData(
              colorScheme: kColorScheme,
              appBarTheme: const AppBarTheme(color: Color(0xFFE3EEFF)),
              scaffoldBackgroundColor: Colors.white,
              listTileTheme:
                  const ListTileThemeData().copyWith(textColor: Colors.white));