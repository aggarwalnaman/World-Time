import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};


  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
//    print(data);

    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color textColor = data['isDayTime'] ? Colors.grey[800] : Colors.white;
    Color bgColor = data['isDayTime'] ? Colors.blueGrey[800] : Colors.blueGrey[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 0.0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async{
                     dynamic result = await Navigator.pushNamed(context, '/location');
                     setState(() {
                       data ={
                         'time' : result['time'],
                         'location': result['location'],
                         'isDayTime' : result['isDayTime'],
                         'flag' : result['flag']
                       };
                     });
                    },
                    icon: Icon(
                        Icons.edit_location,
                      color: textColor,


                    ),
                    label: Text(
                        'Edit Location',
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),

                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/${data['flag']}'),
                      ),
                      SizedBox(width: 10.0,),
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 30.0,
                          letterSpacing: 1.5,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['time'],
                        style: TextStyle(
                          fontSize: 70.0,
                          color: textColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
