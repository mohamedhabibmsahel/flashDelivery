import 'package:flash_delivery_app/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';

import '../theme/theme_helper.dart';
import 'Custom_circular_image_view.dart';
import 'custom_button.dart';

class CustomCardCart extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double rating;

  CustomCardCart({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      color: Colors.white, // Set background color to white
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Set border radius
        side: BorderSide(color: Colors.grey, width: 1.0), // Set border color
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            // First Row
            Row(
              children: [
                // First Column in the First Row - Image in a Circle
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomCircularImageView(
                    imagePath: imageUrl,
                    height: 60.0,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CustomRatingBar(
                          initialRating: rating,
                          alignment: Alignment.topLeft,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.onPrimary.withOpacity(1),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Text(
                          description,
                          style: theme.textTheme.labelMedium
                              ?.copyWith(color: appTheme.gray400),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CustomButton(
              backgroundColor: Colors.black,
              titleColor: Colors.white,
              title: "View cart",
              onPressed: () {
                // Your action here
                print("Button pressed!");
              },
            ),
            CustomButton(
              backgroundColor: Colors.white,
              titleColor: Colors.black,
              title: "View store",
              onPressed: () {
                // Your action here
                print("Button pressed!");
              },
            ),
          ],
        ),
      ),
    );
  }
}
