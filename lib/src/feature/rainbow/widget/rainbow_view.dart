import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:solid_software/src/feature/rainbow/bloc/rainbow_bloc.dart';

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
  @override
  Widget build(BuildContext context) {
    // Get the background color and text color from the RainbowBloc's state.
    final color =
        context.select((RainbowBloc bloc) => bloc.state.backgroundColor);
    final textColor =
        context.select((RainbowBloc bloc) => bloc.state.textColor);
    return GestureDetector(
      onTap: () async {
        HapticFeedback.vibrate();
        context.read<RainbowBloc>().add(const RainbowEvent.changeColors());
      },
      child: AnimatedContainer(
        width: double.infinity,
        height: double.infinity,
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
