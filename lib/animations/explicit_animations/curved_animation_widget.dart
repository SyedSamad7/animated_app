import 'dart:ui';
import 'package:flutter/material.dart';

class CurvedAnimationWidget extends StatefulWidget {
  const CurvedAnimationWidget({super.key});

  @override
  CurvedAnimationWidgetState createState() => CurvedAnimationWidgetState();
}

class CurvedAnimationWidgetState extends State<CurvedAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _easeInAnimation;
  late Animation<double> _bounceOutAnimation;

  @override
  void initState() {
    super.initState();

    // Set up the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);

    // Create CurvedAnimations with different curves
    _easeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _bounceOutAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            // The widget moves horizontally with easeIn and bounceOut animations
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Align(
                  alignment: Alignment(
                    lerpDouble(-1, 1, _easeInAnimation.value)!,
                    0,
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.pinkAccent,
                          Colors.blueAccent,
                          Colors.purple,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purpleAccent.withOpacity(0.5),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    height: 100,
                    width: 100,
                    child: const Center(
                      child: Text(
                        '✨',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Align(
                  alignment: Alignment(
                    lerpDouble(1, -1, _bounceOutAnimation.value)!,
                    0.5,
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.yellowAccent,
                          Colors.orangeAccent,
                          Colors.red,
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orangeAccent.withOpacity(0.5),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    height: 100,
                    width: 100,
                    child: const Center(
                      child: Text(
                        '🔥',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
