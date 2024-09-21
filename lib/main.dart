import 'package:animations_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'animations/basic_animations/animated_position.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          brightness: Brightness.dark, // Ensure brightness is consistent
          primary: Colors.blue,
          secondary: Colors.pinkAccent,
        ),
      ),
      home: const AnimatedPositioned1(),
    );
  }
}
