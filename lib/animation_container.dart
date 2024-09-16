import 'package:flutter/material.dart';

class AnimationContainer extends StatefulWidget {
  const AnimationContainer({super.key});

  @override
  State<AnimationContainer> createState() => _AnimationContainerState();
}

class _AnimationContainerState extends State<AnimationContainer> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  double _opacity1 = 1.0; // Initial opacity of the first widget (visible)
  bool _showFirstChild =
      true; // Tracks which child to show in AnimatedCrossFade
  // Track the current angle of rotation (in turns, where 1.0 = 360 degrees).
  double _rotationAngle = 0.0;

  // Function to toggle size, color, and shape for the AnimatedContainer
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

  // Function to toggle the opacity for AnimatedOpacity widget
  void _toggleOpacity() {
    setState(() {
      _opacity1 = _opacity1 == 1.0 ? 0.0 : 1.0;
    });
  }

  // Function to toggle between first and second child in AnimatedCrossFade
  void _toggleCrossFade() {
    setState(() {
      _showFirstChild = !_showFirstChild;
    });
  }

  // This method will increase the rotation angle by 90 degrees (0.25 turns).
  void _rotate() {
    setState(() {
      _rotationAngle += 0.25; // Rotate by 90 degrees (0.25 of a full turn)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations Demo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // AnimatedContainer widget
              GestureDetector(
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
              const SizedBox(height: 30),

              // AnimatedOpacity widget
              GestureDetector(
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
              const SizedBox(height: 30),

              // AnimatedCrossFade widget
              GestureDetector(
                onTap: _toggleCrossFade,
                child: AnimatedCrossFade(
                  firstChild: Container(
                    width: 200,
                    height: 200,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'First Child',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  secondChild: Container(
                    width: 200,
                    height: 200,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'Second Child',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  crossFadeState: _showFirstChild
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstCurve: Curves.easeInOut,
                  secondCurve: Curves.easeInOut,
                  sizeCurve: Curves.easeInOut,
                  duration: const Duration(seconds: 1),
                ),
              ),
              const SizedBox(
                height: 50,
              ),

              // Animated Rotation
              GestureDetector(
                onTap: _rotate,
                child: AnimatedRotation(
                  turns: _rotationAngle,
                  curve: Curves.easeInOut,
                  duration: const Duration(seconds: 2),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.blue,
                    child: const Icon(Icons.rotate_right,
                        color: Colors.white, size: 50),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
