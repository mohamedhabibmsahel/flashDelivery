import 'package:flutter/material.dart';

class CircularImageWidget extends StatefulWidget {
  final String imageUrl; // Replace with your image URL
  final String title; // Title to be displayed under the image
  final VoidCallback? onTap;

  CircularImageWidget({
    required this.imageUrl,
    required this.title,
    this.onTap,
  });

  @override
  _CircularImageWidgetState createState() => _CircularImageWidgetState();
}

class _CircularImageWidgetState extends State<CircularImageWidget> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
        setState(() {
          isTapped = !isTapped;
        });
      },
      child: Column(
        children: [
          ClipOval(
            child: Container(
              width: 50.0, // Adjust the size as needed
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isTapped ? Colors.red : Colors.transparent,
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl), // Replace with your image source
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0), // Adjust the spacing between image and title
          Text(
            widget.title,
            style: TextStyle(fontSize: 12.0), // Adjust the font size as needed
          ),
        ],
      ),
    );
  }
}
