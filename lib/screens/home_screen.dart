import 'package:animations_app/animations/basic_animations/animated_scale.dart';
import 'package:flutter/material.dart';

import 'package:animations_app/animations/basic_animations/animated_cross_fade.dart';
import 'package:animations_app/animations/basic_animations/animated_opacity.dart';
import 'package:animations_app/animations/basic_animations/animated_rotation.dart';

import '../animations/basic_animations/animated_container.dart';
import '../common_widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations Demo'),
        centerTitle: true,
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              CustomButton(
                label: 'Animated Container',
                color: Colors.blue,
                destinationScreen: AnimatedContainer1(),
              ),
              SizedBox(height: 30),
              CustomButton(
                label: 'Animated Opacity',
                color: Colors.green,
                destinationScreen: AnimatedOpacityWidget(),
              ),
              SizedBox(height: 30),
              CustomButton(
                label: 'Animated Cross Fade',
                color: Colors.red,
                destinationScreen: AnimatedCrossFadeWidget(),
              ),
              SizedBox(height: 30),
              CustomButton(
                label: 'Animated Rotation',
                color: Colors.purple,
                destinationScreen: AnimatedRotationWidget(),
              ),
              SizedBox(height: 30),
              CustomButton(
                label: 'Animated Scale',
                color: Colors.amber,
                destinationScreen: AnimatedScaleWidget(),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
