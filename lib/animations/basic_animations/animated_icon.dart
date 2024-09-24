import 'package:flutter/material.dart';

class AnimatedIconDemo extends StatefulWidget {
  const AnimatedIconDemo({super.key});

  @override
  AnimatedIconDemoState createState() => AnimatedIconDemoState();
}

class AnimatedIconDemoState extends State<AnimatedIconDemo>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 800), // Slower for smoother animation
    );
  }

  void _toggleIcon() {
    setState(() {
      _isOpen = !_isOpen;
      if (_isOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
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
        title: const Text(
          'Menu/Close Animation',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Stack(
        children: [
          // Stunning background with rich gradient colors
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.indigo,
                  Colors.purpleAccent,
                  Colors.orangeAccent
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Center Icon with decoration and animation
          Center(
            child: GestureDetector(
              onTap: _toggleIcon,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Colors.pinkAccent, Colors.deepPurple],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                    BoxShadow(
                      color: Colors.pinkAccent.withOpacity(0.2),
                      blurRadius: 50,
                      spreadRadius: 5,
                      offset: const Offset(0, 15),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.white.withOpacity(0.4),
                    width: 3,
                  ),
                ),
                child: Center(
                  child: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: _animationController,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleIcon,
        backgroundColor: Colors.pinkAccent,
        child: Icon(
          _isOpen ? Icons.close : Icons.menu,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}

class AnimatedIcon1 extends StatefulWidget {
  const AnimatedIcon1({super.key});

  @override
  State<AnimatedIcon1> createState() => _AnimatedIcon1State();
}

class _AnimatedIcon1State extends State<AnimatedIcon1>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  void _toggleIcon() {
    setState(() {
      _isOpen = !_isOpen;
      if (_isOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animated Icon',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.indigo,
              Colors.purpleAccent,
              Colors.orangeAccent
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          ),
          Center(
            child: GestureDetector(
              onTap: _toggleIcon,
              child: Container(
                height: 160,
                width: 160,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                        colors: [Colors.pinkAccent, Colors.deepPurple],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 30,
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(0, 10)),
                      BoxShadow(
                          blurRadius: 30,
                          color: Colors.pinkAccent.withOpacity(0.2),
                          offset: const Offset(0, 15))
                    ],
                    border: Border.all(
                        width: 3, color: Colors.white.withOpacity(0.4))),
                child: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  progress: _animationController,
                  size: 100,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleIcon,
        backgroundColor: Colors.pinkAccent,
        child: Icon(
          _isOpen ? Icons.close : Icons.menu,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
