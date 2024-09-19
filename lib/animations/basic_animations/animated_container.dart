import 'package:flutter/material.dart';

class AnimatedContainer1 extends StatefulWidget {
  const AnimatedContainer1({super.key});

  @override
  State<AnimatedContainer1> createState() => _AnimatedContainer1State();
}

class _AnimatedContainer1State extends State<AnimatedContainer1> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  void _changeContainer() {
    setState(() {
      _width = _width == 100 ? 200 : 100;
      _height = _height == 100 ? 200 : 100;
      _color = _color == Colors.blue ? Colors.red : Colors.blue;
      _borderRadius = _borderRadius == BorderRadius.circular(8)
          ? BorderRadius.circular(50)
          : BorderRadius.circular(8);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: _changeContainer,
          child: AnimatedContainer(
            height: _height,
            width: _width,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: _color,
            ),
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
          ),
        ),
      ),
    );
  }
}
