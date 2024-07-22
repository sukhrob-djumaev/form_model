import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppCircularLoading extends StatelessWidget {
  const AppCircularLoading({
    super.key,
    this.size = 24,
  });

  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: const CircularProgressIndicator(),
    );
  }
}
