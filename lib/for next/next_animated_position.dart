import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedPositioned1 extends StatefulWidget {
  const AnimatedPositioned1({super.key});

  @override
  AnimatedPositioned1State createState() => AnimatedPositioned1State();
}

class AnimatedPositioned1State extends State<AnimatedPositioned1> {
  // bool _isMoved = false;

  // void _animatePosition() {
  //   setState(() {
  //     _isMoved = !_isMoved;
  //   });
  // }

  bool _isMoved = false;
  double _top = 100;
  double _left = 50;
  double _scale = 1;
  Color _boxColor = Colors.white;
  double _opacity = 1.0;
  final Random random = Random();

  void _animatePosition() {
    setState(() {
      _isMoved = !_isMoved;
      _top = _isMoved ? 400 : 100;
      _left = _isMoved ? 200 : 50;
      _scale = _isMoved ? 1.5 : 1;
      _boxColor = _isMoved ? Colors.orangeAccent : Colors.white;
      _opacity = _isMoved ? 0.8 : 1.0;
    });
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      _left += details.delta.dx;
      _top += details.delta.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animated Positioned',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purpleAccent, Colors.blueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          _buildFloatingParticles(screenHeight, screenWidth),
          GestureDetector(
            onPanUpdate: _onDragUpdate,
            child: AnimatedPositioned(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              top: _top,
              left: _left,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: _opacity,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                  width: 150 * _scale,
                  height: 150 * _scale,
                  decoration: BoxDecoration(
                    color: _boxColor,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 30,
                        spreadRadius: 5,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Move Me!",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animatePosition,
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  Widget _buildFloatingParticles(double screenHeight, double screenWidth) {
    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          children: List.generate(
            50,
            (index) => Positioned(
              top: random.nextDouble() * screenHeight,
              left: random.nextDouble() * screenWidth,
              child: AnimatedContainer(
                duration: Duration(seconds: random.nextInt(5) + 2),
                width: random.nextDouble() * 8 + 4,
                height: random.nextDouble() * 8 + 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
