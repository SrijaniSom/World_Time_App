import 'package:flutter/material.dart';
import 'package:world_time_app/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading";
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        'Berlin',
        'data:image/jpeg;base64,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',
        'Europe/Berlin');

    await instance.getTime();
    
    Future.delayed(Duration(seconds: 2), () {
       Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime':instance.isDaytime,
    });
    });

    print(instance.time);
    setState(() {
      time = instance.time;
    });

   
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
              child: Column(
                children: <Widget>[
                  SpinKitRotatingCircle(
                    color: Colors.white,
                    size: 35.0,
                  ),
                  SizedBox(height: 30,),
                  Text('Loading data',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 18.0,
                    letterSpacing: 2.0,
                    
                  ),)
                ],
              ))),
    );
  }
}
