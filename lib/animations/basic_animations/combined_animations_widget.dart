import 'package:flutter/material.dart';

class CombinedAnimationsWidget extends StatefulWidget {
  const CombinedAnimationsWidget({super.key});

  @override
  State<CombinedAnimationsWidget> createState() =>
      _CombinedAnimationsWidgetState();
}

class _CombinedAnimationsWidgetState extends State<CombinedAnimationsWidget>
    with SingleTickerProviderStateMixin {
  bool _isAnimated = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  void _triggerAnimations() {
    setState(() {
      _isAnimated = !_isAnimated;
      if (_isAnimated) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Combined Animations',
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
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            top: _isAnimated ? 70 : 300,
            left: _isAnimated ? 40 : 150,
            child: AnimatedRotation(
              turns: _isAnimated ? 1 : 0,
              duration: const Duration(seconds: 1),
              child: GestureDetector(
                onTap: _triggerAnimations,
                child: AnimatedOpacity(
                  opacity: _isAnimated ? 0.6 : 1,
                  duration: const Duration(seconds: 1),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: _isAnimated ? 200 : 150,
                    width: _isAnimated ? 200 : 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(_isAnimated ? 50 : 25),
                        color: _isAnimated
                            ? Colors.orangeAccent
                            : Colors.purpleAccent,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 30,
                              offset: Offset(0, 10))
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedIcon(
                          icon: AnimatedIcons.menu_close,
                          progress: _animationController,
                          size: _isAnimated ? 100 : 70,
                        ),
                        const Text(
                          "Tap Me!",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _triggerAnimations,
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
