import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart'; // Import the intl package
import 'package:proje/apiRealated/world_time.dart';

class WorldTimeAPI {
  static Future<List<String>> fetchWorldTimeList() async {
    final response =
        await http.get(Uri.parse('http://worldtimeapi.org/api/timezone'));
    if (response.statusCode == 200) {
      List<String> data = (json.decode(response.body) as List).map((e) => e as String).toList();
     return data;
    } else {
      throw Exception('Failed to load world time list');
    }
  }

  static Future<WorldTime> fetchWorldTime(String location) async {
    final response = await http
        .get(Uri.parse('http://worldtimeapi.org/api/timezone/$location'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);


      int hour = int.parse(data['datetime'].split('T')[1].split(':')[0]);
      int minute = int.parse(data['datetime'].split('T')[1].split(':')[1]);

      String timezone = data['timezone'];
      String date = data['datetime'].split('T')[0];

      DateTime dateTime = DateTime.parse(data['datetime']);

      
      String dayOfWeek = DateFormat('EEEE').format(dateTime);

      return WorldTime(
        location: timezone,
        time: data['datetime'],
        hour: hour,
        minute: minute,
        date: date,
        dayOfWeek: dayOfWeek,
      );
    } else {
      throw Exception('Failed to load world time for $location');
    }
  }
}