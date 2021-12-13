// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:vigenesia/Screens/SplashScreen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home:
          SplashScreenPage(), // <-- Buat Class Baru yg bernama MyScreen di dalam lib bikin folder baru screens isinya MyScreen.dart
    ));
