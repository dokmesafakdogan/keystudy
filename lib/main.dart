import 'package:flutter/material.dart';
import 'package:proje/screens/login_screen.dart';
import 'package:proje/theme/theme_constants.dart';
import 'package:proje/provider/theme_provider.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MainApp(),
    ),
  );
}


ThemeProvider themeProvider = ThemeProvider();


class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
     
        return MaterialApp(
         
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          
          title: 'World Clock',
          home: const LoginScreen(),
          themeMode: themeProvider.themeMode
        );
      }
    
  }
