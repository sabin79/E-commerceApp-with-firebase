import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final double scale;
  Loader({super.key, this.scale = 1});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: CircularProgressIndicator(
        color: Colors.black,
        semanticsLabel: 'Circular Progress Bar',
      ),
    );
  }
}
