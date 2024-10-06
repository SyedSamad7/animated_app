import 'package:flutter/material.dart';

class FadeTransitionAnimationWidget extends StatefulWidget {
  const FadeTransitionAnimationWidget({super.key});

  @override
  State<FadeTransitionAnimationWidget> createState() =>
      _FadeTransitionAnimationWidgetState();
}

class _FadeTransitionAnimationWidgetState
    extends State<FadeTransitionAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _fadeAnimation = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fade Transition Animation'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: _buildFadingWidget(),
        ),
      ),
    );
  }

  // Beautiful widget to apply FadeTransition on
  Widget _buildFadingWidget() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Colors.deepPurple, Colors.purpleAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.5),
            blurRadius: 30,
            spreadRadius: 8,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'Flutter Magic ✨',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
            letterSpacing: 1.5,
            shadows: [
              Shadow(
                color: Colors.black45,
                blurRadius: 10,
                offset: Offset(3, 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
