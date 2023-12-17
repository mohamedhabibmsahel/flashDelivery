import 'package:flash_delivery_app/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';

import '../theme/theme_helper.dart';
import 'custom_image_view.dart';

class CustomCardRestaurantViewAll extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double rating;

  CustomCardRestaurantViewAll({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.rating,

  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 100,
      width: screenWidth,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4.0,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Stack(
                alignment: Alignment.topRight, // Align to the top-right corner
                children: [
                  CustomImageView(imagePath : imageUrl,height: 100.0,width:100,fit: BoxFit.cover,radius:BorderRadius.circular(12.0)),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CustomRatingBar(initialRating:rating,alignment: Alignment.topLeft),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onPrimary.withOpacity(1))
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Text(
                      description,
                      style: theme.textTheme.labelMedium?.copyWith(
                          color: appTheme.gray400)
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}