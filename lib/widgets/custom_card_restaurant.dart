import 'package:flash_delivery_app/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';

import '../theme/theme_helper.dart';
import 'custom_image_view.dart';

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double rating;

  CustomCard({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.rating,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0, bottom: 24, left: 12, right: 12),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 4.0,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: Alignment.topRight, // Align to the top-right corner
                children: [
                  CustomImageView(imagePath : imageUrl,height: 120.0,width:double.infinity,fit: BoxFit.cover,radius:BorderRadius.circular(12.0)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomRatingBar(initialRating:rating,alignment: Alignment.topLeft),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onPrimary.withOpacity(1))
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  description,
                  style: theme.textTheme.labelMedium?.copyWith(
                color: appTheme.gray400)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}