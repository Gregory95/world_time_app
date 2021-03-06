import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  // ignore: prefer_typing_uninitialized_variables
  var time; // the time in that location
  String flag; // url to an asset flag icon
  String endpoint; // location url for api endpoint
  bool isDayTime = false; // true or false if daytime or not

  WorldTime(
      {required this.location,
      required this.flag,
      required this.endpoint,
      required this.isDayTime});

  Future<void> getTime() async {
    try {
      var fullUrl = Uri.parse('http://worldtimeapi.org/api/timezone/$endpoint');
      Response response = await get(fullUrl);
      Map data = jsonDecode(response.body);

      //get properties from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //create a DateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      // set the time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}
