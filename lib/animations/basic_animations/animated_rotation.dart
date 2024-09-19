import 'package:flutter/material.dart';

class AnimatedRotationWidget extends StatefulWidget {
  const AnimatedRotationWidget({super.key});

  @override
  State<AnimatedRotationWidget> createState() => _AnimatedRotationWidgetState();
}

class _AnimatedRotationWidgetState extends State<AnimatedRotationWidget> {
  double _rotationAngle = 0.0;

  void _rotate() {
    setState(() {
      _rotationAngle += 0.25;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Rotation'),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: _rotate,
          child: AnimatedRotation(
            turns: _rotationAngle,
            duration: const Duration(seconds: 2),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: const Icon(
                Icons.rotate_right,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
