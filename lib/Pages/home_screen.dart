import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child:Column(children: <Widget>[
          FlatButton.icon(
          onPressed: ( ) { 
            Navigator.pushNamed(context, '/choose_location');}, 
          icon: Icon(
            Icons.edit_location,
            color: Colors.black,
          ), label: Text('Edit Location'))
        ],) ),
    );
  }
}
