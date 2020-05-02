import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class worldTime {

  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;
  worldTime({ this.flag, this.location,this.url});

  Future<void> getTime() async{

    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
//    print(data);

      String datetime = data['datetime'];
      String offset = data['utc_offset'];
//    print(datetime);
//    print(offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset.substring(1,3)),minutes: int.parse(offset.substring(4))));
//    print(now);

      isDayTime = now.hour > 7 && now.hour<19 ? true : false;
      time = DateFormat.jm().format(now);

    }


    catch(e)
    {
      print("Caught Error : $e");
      time="Could not get time data";
    }
  }
}


