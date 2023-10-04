import 'dart:math';

import 'package:flutter/material.dart';

class RainbowView extends StatelessWidget {
  const RainbowView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AnimatedContainerExample(),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  int color = 0xFFFF0000;
  int textColor = 0xFF00FFFF;
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          const alpha = 255;
          final red = random.nextInt(256);
          final green = random.nextInt(256);
          final blue = random.nextInt(256);

          color = (alpha << 24) | (red << 16) | (green << 8) | blue;

          final invertedRed = 255 - red;
          final invertedGreen = 255 - green;
          final invertedBlue = 255 - blue;

          textColor = (alpha << 24) |
              (invertedRed << 16) |
              (invertedGreen << 8) |
              invertedBlue;
        });
      },
      child: AnimatedContainer(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(color),
        alignment: Alignment.center,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
            color: Color(textColor),
            fontWeight: FontWeight.w700,
            fontSize: 36.0,
          ),
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: const Text('Hello There'),
        ),
      ),
    );
  }
}
