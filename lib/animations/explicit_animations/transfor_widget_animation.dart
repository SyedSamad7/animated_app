import 'package:flutter/material.dart';

class TransFormWidgetAnaimtion extends StatefulWidget {
  const TransFormWidgetAnaimtion({super.key});

  @override
  State<TransFormWidgetAnaimtion> createState() =>
      _TransFormWidgetAnaimtionState();
}

class _TransFormWidgetAnaimtionState extends State<TransFormWidgetAnaimtion>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _translationAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _rotationAnimation = Tween<double>(begin: 0, end: 7).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 1, end: 1.5).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _translationAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(1.5, 0)).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transform Animation'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) => Transform(
            transform: Matrix4.identity()
              ..rotateZ(_rotationAnimation.value)
              ..scale(_scaleAnimation.value)
              ..translate(_translationAnimation.value.dx * 50),
            alignment: Alignment.center,
            child: _buildTransformedWidget(),
          ),
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
