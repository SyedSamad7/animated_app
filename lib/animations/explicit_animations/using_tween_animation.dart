import 'package:flutter/material.dart';

class UsingTweenAnimatioOpacityWidget extends StatefulWidget {
  const UsingTweenAnimatioOpacityWidget({super.key});

  @override
  UsingTweenAnimatioOpacityWidgetState createState() =>
      UsingTweenAnimatioOpacityWidgetState();
}

class UsingTweenAnimatioOpacityWidgetState
    extends State<UsingTweenAnimatioOpacityWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isAnimate = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Animation duration
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 0.4).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start the animation
    // _controller.forward();
  }

  _triggerAnimation() {
    setState(() {
      _isAnimate = !_isAnimate;
      if (_isAnimate) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Smooth Opacity Animation',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade900, Colors.blue.shade600],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _animation.value,
                child: GestureDetector(
                  onTap: _triggerAnimation,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(30), // Softer rounded corners
                      color: Colors.white.withOpacity(0.9),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                        BoxShadow(
                          color: Colors.purpleAccent.withOpacity(0.2),
                          blurRadius: 50,
                          spreadRadius: 10,
                          offset: const Offset(0, 15),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Hello Flutter!',
                        style: TextStyle(
                          fontSize: 26, // Larger font size
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple, // More vibrant color
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black26,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
