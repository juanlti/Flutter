import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
//atributos
  double _widthContainer = 50;
  double _heightContainer = 50;

  BorderRadiusGeometry _borderRadiusGeometryContainer =
      BorderRadius.circular(150);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: metodoModificarValores,
          child: Container(
            width: _widthContainer,
            height: _heightContainer,
            decoration: BoxDecoration(
              borderRadius: _borderRadiusGeometryContainer,
            ),
          ),
        ),
      ),
    );
  }

  metodoModificarValores() {
    final valorRandom = Random();
    _borderRadiusGeometryContainer =
        BorderRadius.circular(valorRandom.nextInt(300).toDouble() + 70);
    setState(() {
      _widthContainer = valorRandom.nextInt(300).toDouble() + 70;

      _heightContainer = valorRandom.nextInt(300).toDouble() + 70;
    });
  }
}
