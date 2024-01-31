import 'package:flutter/material.dart';
import 'package:proje/widgets/worldclock.dart';



class WatchesScreen extends StatefulWidget {
  const WatchesScreen({super.key});

  @override
  State<WatchesScreen> createState() => _WatchesScreenState();
}

class _WatchesScreenState extends State<WatchesScreen> {





  final myController = TextEditingController();


    @override
    void dispose(){
      myController.dispose();
      super.dispose();
    }



   @override 
initState(){
  super.initState();
  myController.addListener(_printLatestValue);
}
     _printLatestValue(){
      print('$myController.text');
     }




  @override
  Widget build(BuildContext context) {
  
    bool isNightMode = false;


  



  
    return Scaffold(
      body: Stack(
        children: [
          // Main content
           const  Positioned.fill(

            child: Padding(
              padding:   EdgeInsets.only(top:265.0),
              child: WorldClock(),
            )
          ),

          // Custom App Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom:645,
            child: Container(
            //  padding: const EdgeInsets.only(top: 233.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
             
              child:
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                
                children: [
                   Padding(padding: const EdgeInsets.only(top: 100,left: 30),
                  child:
                   Column(
                  children: [
                   const Text('Merhaba özgür'),
                     
                    
                    Row(children: [
                    Text(DateTime.now().hour.toString(),style: const TextStyle(fontSize: 34),),
                    const Text(':',style: TextStyle(fontSize: 34)),
                    Text(DateTime.now().minute.toString(),style: const TextStyle(fontSize: 34)),
                    ],),
                    Row(
                      children: [
                        Text(DateTime.now().day.toString(),style: const TextStyle(fontSize: 23)),
                        const Text('.',style: TextStyle(fontSize: 23)),
                        Text(DateTime.now().month.toString(),style: const TextStyle(fontSize: 23)),
                        const Text('.',style: TextStyle(fontSize: 23)),
                        Text(DateTime.now().year.toString(),style: const TextStyle(fontSize: 23))
                      ],
                    ),
                    
                  ],
                ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 180,bottom: 45),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                        isNightMode = !isNightMode;
                       });
                      },
                      icon: Ink(
                          decoration: const ShapeDecoration(
                              shape: CircleBorder(), color: Colors.blue),
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.dark_mode_outlined,
                              color: Colors.white,
                            ),
                            
                          ),
                          ),
                      splashRadius: 25,
                      tooltip: 'dark mode icon',
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 250,
            right: 34,
            left: 34,
            child: TextField(controller: myController,
            onChanged: (text) {
             
            },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search, size: 34),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
