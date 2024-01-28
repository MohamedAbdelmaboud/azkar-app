import 'package:flutter/material.dart';
import 'package:sebha/screens/splashScreen.dart';
import 'screens/homeScreen.dart';
import 'screens/husnaScreen.dart';
import 'screens/sebhaScreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
} 

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
