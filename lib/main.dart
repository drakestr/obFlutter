import 'package:flutter/material.dart';
import 'package:ob_tj_day_one/carDetail/carDetailScreen.dart';
import 'package:ob_tj_day_one/home/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OB Trans Jakarta',
      theme: ThemeData(fontFamily: 'Poppins'),
      // home: HomeScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/carDetail': (context) => CarDetailScreen(),
      },
    );
  }
}