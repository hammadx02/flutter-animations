import 'package:flutter/material.dart';
import 'package:flutter_animations/example_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // theme: ThemeData(brightness: Brightness.dark),
      // darkTheme: ThemeData(brightness: Brightness.dark),
      // themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animations',
      home: Example1(),
    );
  }
}
