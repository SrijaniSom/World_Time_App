import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map? data = {};
  @override
  Widget build(BuildContext context) {
    data = (data?.isNotEmpty ?? false)
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map?;
    String bgImg = (data?['isDayTime'] ?? false) ? "day.png" : "night.png";
    Color bgColor = (data?['isDayTime'] ?? false) ? Colors.blue : Colors.indigo;

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/$bgImg'),
                fit: BoxFit.cover,
              )),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FlatButton.icon(
                        
                          onPressed: () async {
                            dynamic result = await Navigator.pushNamed(
                                context, '/choose_location');
                                setState(() {
                               data = {
                              'time':result['time'],
                              'location':result['location'],
                              'flag':result['flag'],
                              'isDaytime':result['isDaytime'],
                            };
                                });

                          },
                          icon: Icon(
                            Icons.edit_location,
                            color: Colors.white,
                          ),
                          label: Text('Edit Location',
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 20.0,
                            letterSpacing: 1.8,
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              data?['location'],
                              style: TextStyle(
                                fontSize: 15.0,
                                letterSpacing: 1.5,
                                color: Colors.grey[300],
                              ),
                            ),
                          ]),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        data?['time'],
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ))),
        ));
  }
}
