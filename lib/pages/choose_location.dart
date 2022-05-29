import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        endpoint: 'Europe/London',
        location: 'London',
        flag: 'uk.png',
        isDayTime: false),
    WorldTime(
        endpoint: 'Europe/Athens',
        location: 'Athens',
        flag: 'greece.png',
        isDayTime: false),
    WorldTime(
        endpoint: 'Africa/Cairo',
        location: 'Cairo',
        flag: 'egypt.png',
        isDayTime: false),
    WorldTime(
        endpoint: 'Africa/Nairobi',
        location: 'Nairobi',
        flag: 'kenya.png',
        isDayTime: false),
    WorldTime(
        endpoint: 'America/Chicago',
        location: 'Chicago',
        flag: 'usa.png',
        isDayTime: false),
    WorldTime(
        endpoint: 'America/New_York',
        location: 'New York',
        flag: 'usa.png',
        isDayTime: false),
    WorldTime(
        endpoint: 'Asia/Seoul',
        location: 'Seoul',
        flag: 'south_korea.png',
        isDayTime: false),
    WorldTime(
        endpoint: 'Asia/Jakarta',
        location: 'Jakarta',
        flag: 'indonesia.png',
        isDayTime: false),
    WorldTime(
        endpoint: 'Asia/Cyprus',
        location: 'Cyprus',
        flag: 'cyprus.png',
        isDayTime: false),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
