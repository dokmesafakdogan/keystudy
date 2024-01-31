import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(111),
        child: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                  ),
                ),
          elevation: 8,
          flexibleSpace:  const  Align(
            alignment: Alignment.center,
            child: Padding(padding:  EdgeInsets.only(top: 80),
            child: Text('WORLD TIME', style: TextStyle(fontSize: 33),),
            ),
          ),
        ),
      ),
      
      body:  Padding(
        padding: const EdgeInsets.only(top:100.0),
        child: Column(
          children: [ 
          
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Container(
                  width: 160.0,
                  height: 160.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(23)
                  ),
                  child:   const Center(
                    child:  Text('asd',style:   TextStyle(
                      fontSize: 40,fontWeight: FontWeight.bold,
                      color: Colors.red),),
                  ),
                ),
                const SizedBox(width: 8.0),
                const Text(':',
                style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),
                const SizedBox(width: 8), 
                Container(
                  width: 160.0,
                  height: 160.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromRGBO(0, 0, 0, 1)),
                    borderRadius: BorderRadius.circular(23)
                  ),
                  child:  const  Center(
                    child:  Text('sdfa',style:   TextStyle(
                      fontSize: 40,fontWeight: FontWeight.bold,
                      color: Colors.red),),
                ),
                )
            ],
           ),
           const SizedBox(height: 45,),
         
          const Text('ssadfd'),
          
          ],
        ),
      ),
    );
  }
}
