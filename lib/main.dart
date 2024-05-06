import 'package:chronicles/widgets/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:chronicles/widgets/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      // home: HomeScreen()
      themeMode: ThemeMode.light, // Set theme mode to light
      theme: ThemeData(
        brightness: Brightness.light, // Set brightness to light
        primarySwatch: Colors.blue,
      ),
    );
  }
}
