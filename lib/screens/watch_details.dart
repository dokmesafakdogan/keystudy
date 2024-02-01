import 'package:flutter/material.dart';
import 'package:proje/apiRealated/world_time_api.dart';
import 'package:proje/apiRealated/world_time.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.selectedCountry}) : super(key: key);

  final String selectedCountry;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Future<WorldTime> worldTime;
  
  @override
  void initState() {
    super.initState();
    worldTime = fetchWorldTimeData(widget.selectedCountry);
  }


  Future<WorldTime> fetchWorldTimeData(String location) async {
    return WorldTimeAPI.fetchWorldTime(location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(111),
        child: AppBar(
          automaticallyImplyLeading: false,
        leading: IconButton(iconSize: 45,
          icon:const Icon(Icons.chevron_left),
        color: Theme.of(context).colorScheme.onPrimary,
        onPressed: Navigator.of(context).pop),
        
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
            ),
          ),
          elevation: 8,
          flexibleSpace: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Text(
                'WORLD TIME',
                style: TextStyle(
                  fontSize: 33,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: FutureBuilder<WorldTime>(
          future: worldTime,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              WorldTime worldTimeData = snapshot.data!;
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 160.0,
                        height: 160.0,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(23)),
                        child: Center(
                          child: Text(
                            worldTimeData.hour.toString(),
                            style: TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                       Text(
                        ':',
                        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 160.0,
                        height: 160.0,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            border:
                                Border.all(color: const Color.fromRGBO(0, 0, 0, 1)),
                            borderRadius: BorderRadius.circular(23)),
                        child: Center(
                          child: Text(
                            worldTimeData.minute.toString(),
                            style: TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 45.0),
                  Text(
                    worldTimeData.location,
                    style: TextStyle(fontSize: 34,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    worldTimeData.dayOfWeek,
                    style: TextStyle( fontSize: 30,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    worldTimeData.date,
                    style: TextStyle(fontSize: 23,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
