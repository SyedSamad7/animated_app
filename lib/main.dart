import 'package:animations_app/animations/explicit_animations/fade_transition_animation_widget.dart';
import 'package:animations_app/animations/explicit_animations/transfor_widget_animation.dart';
import 'package:flutter/material.dart';

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
      home: const FadeTransitionAnimationWidget(),
    );
  }
}
