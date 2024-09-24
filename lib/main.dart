import 'package:flutter/material.dart';
import 'animations/basic_animations/animated_icon.dart';

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
        colorScheme: ColorScheme.fromSwatch().copyWith(
          brightness: Brightness.dark,
          primary: Colors.blue,
          secondary: Colors.pinkAccent,
        ),
      ),
      home: const AnimatedIcon1(),
    );
  }
}
