import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   Text('World Time',style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontSize: 56),),
       ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      
      body:
      
       Center(
        
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
           children: [
             Text('Enter your name here.',
             style:TextStyle(color: Theme.of(context).colorScheme.onPrimary,
             fontSize: 23,),
             
             ),
             const SizedBox(height: 45,),
              TextField(
                 keyboardType: TextInputType.text,
                 
                 decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Whats your name.',
                              
                              floatingLabelAlignment: FloatingLabelAlignment.center,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                
                              ),
                            ),
              ),
                   
           ],
         ),
       ),);
        
    
  }
}