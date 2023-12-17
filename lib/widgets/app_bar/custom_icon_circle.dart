import 'package:flutter/material.dart';

class CircularImageWidget extends StatelessWidget {
  final String imageUrl; // Replace with your image URL
  final String title; // Title to be displayed under the image

  CircularImageWidget({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Container(
            width: 50.0, // Adjust the size as needed
            height: 50.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imageUrl), // Replace with your image source
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.0), // Adjust the spacing between image and title
        Text(
          title,
          style: TextStyle(fontSize: 12.0), // Adjust the font size as needed
        ),
      ],
    );
  }
}