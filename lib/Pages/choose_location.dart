import 'package:flutter/material.dart';
import 'package:world_time/Services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London',location: 'London',flag: 'download.png'),
    WorldTime(url: 'Europe/Berlin',location: 'Athens',flag: 'download.png'),
    WorldTime(url: 'Africa/Cairo',location: 'Cairo',flag: 'download.png'),
    WorldTime(url: 'Africa/Nairobi',location: 'Nairobi',flag: 'download.png'),
    WorldTime(url: 'America/New_York',location: 'New York',flag: 'download.png'),
    WorldTime(url: 'Asia/Dubai',location: 'Dubai',flag: 'download.png'),
    WorldTime(url: 'Asia/Saoul',location: 'Saoul',flag: 'download.png'),
    WorldTime(url: 'Asia/Karachi',location: 'Karachi',flag: 'download.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to homescreen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime' : instance.isDaytime,
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
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
