import 'package:flutter/material.dart';

class AnimatedOpacityWidget extends StatefulWidget {
  const AnimatedOpacityWidget({super.key});

  @override
  State<AnimatedOpacityWidget> createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  double _opacity1 = 1.0;

  void _toggleOpacity() {
    setState(() {
      _opacity1 = _opacity1 == 1.0 ? 0.0 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Opacity'),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleOpacity,
          child: AnimatedOpacity(
            opacity: _opacity1,
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
