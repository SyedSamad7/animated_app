import 'package:flutter/material.dart';

class TransforWidgetAnimation extends StatefulWidget {
  const TransforWidgetAnimation({super.key});

  @override
  State<TransforWidgetAnimation> createState() =>
      _TransforWidgetAnimationState();
}

class _TransforWidgetAnimationState extends State<TransforWidgetAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _translateAnimation;

  @override
  void initState() {
    super.initState();

    // Initializing the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    // Define rotation animation (0 to 2 * pi for a full circle)
    _rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.1416).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Define scale animation (from 1x to 1.5x)
    _scaleAnimation = Tween<double>(begin: 1, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Define translation animation (moving along X-axis)
    _translateAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(1.5, 0)).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
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
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: const Text("Transform Animation"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform(
              // Apply all transformations
              transform: Matrix4.identity()
                ..rotateZ(_rotationAnimation.value)
                ..scale(_scaleAnimation.value)
                ..translate(_translateAnimation.value.dx * 100),
              alignment: Alignment.center,
              child: _buildTransformedWidget(),
            );
          },
        ),
      ),
    );
  }

  // Widget to transform
  Widget _buildTransformedWidget() {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Colors.pink, Colors.orange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'WOW!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
