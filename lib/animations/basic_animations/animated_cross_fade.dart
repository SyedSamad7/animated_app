import 'package:flutter/material.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({super.key});

  @override
  State<AnimatedCrossFadeWidget> createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool _showFirstChild = true;

  void _toggleCrossFade() {
    setState(() {
      _showFirstChild = !_showFirstChild;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Cross Fade'),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
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
            duration: const Duration(seconds: 1),
          ),
        ),
      ),
    );
  }
}
