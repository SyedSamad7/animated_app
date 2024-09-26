import 'package:flutter/material.dart';

import 'animations/explicit_animations/using_tween_animation.dart';

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
      home: const UsingTweenAnimatioOpacityWidget(),
    );
  }
}
