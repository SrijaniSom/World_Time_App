import 'dart:js';

import 'package:flutter/material.dart';
import 'Pages/home_screen.dart';
import 'Pages/choose_location.dart';
import 'Pages/loading.dart';

void main() async => runApp(MaterialApp(
  
    
    routes: {
       '/': (context) => Loading(),
     '/home': (context) => Home(),
     '/choose_location':(context) => ChooseLocation(),
    },
    initialRoute: '/',
    
    ));
