import 'package:flutter/material.dart';
import 'package:proje/screens/watches_screen.dart';


var kColorScheme = ColorScheme.fromSeed(
  seedColor:const Color.fromARGB(255, 192, 213, 244),
  

);
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor:const Color(0xFF002359),
  onPrimary: const Color(0xFF02327D)
   );



void main() {
  
 
  runApp(const  MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key,});

 


  @override
  Widget build(BuildContext context) {
    
    return       MaterialApp(
      debugShowCheckedModeBanner: false,
      
      darkTheme: ThemeData.dark().copyWith(
       
        colorScheme: kDarkColorScheme,
        
       
          
      ),
      theme: ThemeData().copyWith(
        
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
       
       
       
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),),
      title: 'World Clock',
       home:const WatchesScreen()
       
       //FutureBuilder<List<WorldTime>>(
        
      //   builder: (context, snapshot) {
      //     if(snapshot.connectionState == ConnectionState.waiting){
      //       return const WatchesScreen();
      //     }
      //     if(snapshot.hasData){
      //       return const WatchesScreen();
      //     }
      //     return const WatchesScreen();
      //   },   
      // ),
      
        );
  }
}
