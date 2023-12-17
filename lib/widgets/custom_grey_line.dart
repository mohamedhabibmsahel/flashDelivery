import 'package:flutter/material.dart';

class GreyLine extends StatelessWidget {
  const GreyLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0,
      color: Colors.grey.withOpacity(0.1),
    );
  }
}