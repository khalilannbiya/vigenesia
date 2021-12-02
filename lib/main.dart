import 'package:flutter/material.dart';
import 'package:vigenesia/Screens/SplashScreen.dart';

import 'Screens/Login.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          SplashScreenPage(), // <-- Buat Class Baru yg bernama MyScreen di dalam lib bikin folder baru screens isinya MyScreen.dart
    ));
