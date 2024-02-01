// import 'package:flutter/material.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     saveData('username', 'john_doe'); // Save data
    
//     return FutureBuilder<String?>(
//       future: readData('username'), // Read data
//       builder: (context, dataSnapshot) {
//         if (dataSnapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator(); // Loading indicator while reading data
//         } else if (dataSnapshot.hasError) {
//           return Text('Error: ${dataSnapshot.error}');
//         } else {
//           String? username = dataSnapshot.data;
//           return Text('Username: $username');
//         }
//       },
//     );
//   }
// }