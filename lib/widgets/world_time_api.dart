import 'dart:convert';

import 'package:proje/world_time.dart';
import 'package:http/http.dart'as http;

class WorldTimeAPI {
  static Future<List<WorldTime>> fetchWorldTimeList() async {
    final response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => WorldTime(location: item,  url: '', time: '')).toList();
    } else {
      throw Exception('Failed to load world time list');
    }
  }

  static Future<String> fetchWorldTime(String location) async {
    final response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$location'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      String time = data['datetime'];
     
      return time;
      

    } else {
      throw Exception('Failed to load world time for $location');
    }
  }
}