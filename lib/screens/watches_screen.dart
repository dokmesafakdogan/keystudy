import 'package:flutter/material.dart';
import 'package:proje/main.dart';
import 'package:proje/screens/splash.dart';
import 'package:proje/screens/watch_details.dart';
import 'package:proje/theme/theme_constants.dart';
import 'package:proje/provider/theme_provider.dart';
import 'package:proje/utility/extensions/date_time_extension.dart';
import 'package:proje/apiRealated/world_time_api.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class WatchesScreen extends StatefulWidget {
  const WatchesScreen({super.key});

  @override
  State<WatchesScreen> createState() => _WatchesScreenState();
}

class _WatchesScreenState extends State<WatchesScreen> {
  late Future<List<String>> worldTimeList;
  final myController = TextEditingController();
  bool isDarkmode = false;
  String selam = '';
  @override
  void initState() {
    super.initState();
    updateSelam();

    worldTimeList = fetchWorldTimeData();
  }

  Future<List<String>> fetchWorldTimeData() async {
    List<String> timeList = await WorldTimeAPI.fetchWorldTimeList();
    return timeList;
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void updateSelam() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    final String suan;
    if (hour >= 6 && hour < 12) {
      suan = 'Goodmorning';
    } else if (hour >= 12 && hour < 18) {
      suan = 'Good Afternoon';
    } else {
      suan = 'GoodNight';
    }

    setState(() {
      selam = suan;
    });
  }

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);

    return FutureBuilder<List<String>>(
      future: worldTimeList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<String> filteredList = snapshot.data!
              .where((item) =>
                  item.toLowerCase().contains(myController.text.trim()))
              .toList();

          return Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 265.0),
                    child: ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Card(
                              margin: const EdgeInsets.only(
                                  left: 30, right: 30, bottom: 23),
                              elevation: 4,
                              color: Theme.of(context).colorScheme.secondary,
                              child: ListTile(
                                title: Text(
                                  filteredList[index],
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                ),
                                onTap: () {
                                  snapshot.data![index];
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                          selectedCountry:
                                              snapshot.data![index]),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 375, top: 2.8),
                              child: IconButton(
                                onPressed: () {
                                  snapshot.data![index];
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                          selectedCountry:
                                              snapshot.data![index]),
                                    ),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    width: 5,
                                  ),
                                ),
                                icon: Ink(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 645,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.secondary,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 100, left: 30),
                          child: Column(
                            children: [
                              Text(
                                selam,
                                style: TextStyle(
                                  fontSize: 23,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              Text(
                                DateTime.now().toformattedTime(),
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                              Text(
                                DateTime.now().toFormattedDate(),
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 120, bottom: 45),
                          child: IconButton(
                            onPressed: () {
                              themeProvider.toggleTheme();
                              setState(() {
                                isDarkmode =
                                    themeProvider.currentTheme == darkTheme;
                              });
                            },
                            icon: Ink(
                              decoration: ShapeDecoration(
                                  shape: const CircleBorder(),
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Icon(
                                    isDarkmode
                                        ? Icons.light_mode_outlined
                                        : Icons.dark_mode_outlined,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),
                            ),
                            splashRadius: 25,
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
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: myController,
                    onChanged: (value) {
                      setState(() {});
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
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
