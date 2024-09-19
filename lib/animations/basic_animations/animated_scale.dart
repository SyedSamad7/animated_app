import 'package:flutter/material.dart';

class AnimatedScaleWidget extends StatefulWidget {
  const AnimatedScaleWidget({super.key});

  @override
  AnimatedScaleWidgetState createState() => AnimatedScaleWidgetState();
}

class AnimatedScaleWidgetState extends State<AnimatedScaleWidget> {
  double _scale = 1.0; // Initial scale factor

  void _toggleScale() {
    setState(() {
      _scale = _scale == 1.0 ? 0.0 : 1.0; // Toggle between scale 1.0 and 2.0
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scale Animation'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _toggleScale,
              child: AnimatedScale(
                scale: _scale,
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Scale Me',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleScale,
              child: const Text('Toggle Scale'),
            ),
          ],
        ),
      ),
    );
  }
}
