import 'package:flutter/material.dart';
import 'package:proje/screens/splash.dart';
import 'package:proje/screens/watch_details.dart';
import 'package:proje/widgets/world_time_api.dart';
import 'package:proje/world_time.dart';

class WorldClock extends StatefulWidget {
  const WorldClock({
    super.key,
  });

  @override
  State<WorldClock> createState() {
    return _WorldClockState();
  }
}

class _WorldClockState extends State<WorldClock> {
  late Future<List<WorldTime>> worldTimeList;
  
  @override
  void initState() {
    super.initState();
    worldTimeList = fetchWorldTimeData();
  }

  Future<List<WorldTime>> fetchWorldTimeData() async {
    List<WorldTime> timeList = await WorldTimeAPI.fetchWorldTimeList();

    for (var worldTime in timeList) {
      String time = await WorldTimeAPI.fetchWorldTime(worldTime.location);

      worldTime.time = time;
    }

    return timeList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WorldTime>>(
        future: worldTimeList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: 350,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Card(
                      margin: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 23),
                      elevation: 20,
                      color: Theme.of(context).colorScheme.primary,
                      child: ListTile(
                        title: Text(snapshot.data![index].location),
                        subtitle: Text(snapshot.data![index].time),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const DetailsScreen(),
                          ));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 375, top: 10),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const DetailsScreen(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Colors.white,
                            width: 5,
                          ),
                        ),
                        icon: Ink(
                          child: const Padding(
                            padding: EdgeInsets.all(4),
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
    );
  }
}
