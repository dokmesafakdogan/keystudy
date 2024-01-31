import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen ({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color:const Color(0xFF002359),
      child: Image.asset('assets/DOP logo.png'),
      
    );
  }
}
