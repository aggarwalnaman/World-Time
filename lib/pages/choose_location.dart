import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class chooseLocation extends StatefulWidget {
  @override
  _chooseLocationState createState() => _chooseLocationState();
}

class _chooseLocationState extends State<chooseLocation> {

  List<worldTime> locations = [
    worldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    worldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    worldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    worldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    worldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    worldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    worldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    worldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    worldTime(url: 'Asia/kolkata' , location: 'India' , flag: 'india.jpg'),
    worldTime(url: 'Asia/Karachi' , location: 'Pakistan' , flag: 'pakistan.jpg'),
  ];

  void updateTime(index) async{
      worldTime instance = locations[index];
      await instance.getTime();
      Navigator.pop(context, {
        'location' : instance.location,
        'flag' : instance.flag,
        'time' : instance.time,
        'isDayTime' : instance.isDayTime,
      });
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body:ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0 , horizontal: 4.0),
            child: Card(
              color: Colors.grey[50],
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }

      ),
    );
  }
}
