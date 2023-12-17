import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color titleColor;
  final String title;
  final VoidCallback onPressed;
  final double radius;

  CustomButton({
    required this.backgroundColor,
    required this.titleColor,
    required this.title,
    required this.onPressed,
    this.radius = 8.0, // Default radius value
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Set the width to take maximum available space
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: titleColor,
          ),
        ),
      ),
    );
  }
}
