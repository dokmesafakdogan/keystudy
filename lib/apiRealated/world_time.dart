class WorldTime {
  final String location;
  final String time;
  final int hour;
  final int minute;
  final String date;
  final String dayOfWeek;

  WorldTime({
    required this.location,
    required this.time,
    required this.hour,
    required this.minute,
    required this.date,
    required this.dayOfWeek,
  });
}




 //isDayTime = now.hour > 6 && now.hour < 20 ? true : false;


//  itemBuilder: (context, index) => GestureDetector(
//                             onTap: (){
//                               Navigator.of(context).push(
//                                         MaterialPageRoute(
//                                           builder: (context) => DetailsScreen(
//                                             selectedCountry:
//                                                 snapshot.data![index],
//                                   ),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               snapshot.data![index],
//                             ),
//                           ),