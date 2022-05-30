import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location = "";
  String flag = "";
  String time = "";
  String url = "";
  bool isDaytime = false;

  WorldTime(String location, String flag, String url) {
    this.location = location;
    this.flag = flag;
    this.url = url;
  }

  Future<void> getTime() async {
    try {
      String link = 'http://worldtimeapi.org/api/timezone/' + url;
      Response response = await get(Uri.parse(link));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];

      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDaytime = (now.hour > 5 && now.hour < 18) ? true : false;

      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'Sorry! Can not get the time data';
    }
  }
}
