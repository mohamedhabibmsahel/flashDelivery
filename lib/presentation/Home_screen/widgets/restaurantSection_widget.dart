import 'package:flutter/material.dart';

import '../../../widgets/custom_card_restaurant.dart';
import '../models/restaurant_card_model.dart';

class RestaurantSection extends StatelessWidget {
  final String title;
  final List<RestaurantCardModel> restaurantInfo;

  const RestaurantSection({super.key, required this.title,required this.restaurantInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap:() {

                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 30.0,
                ),


              ),
            ],
          ),
        ),
        Container(
          height: 250.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: restaurantInfo.length,
            itemBuilder: (context, index) {
              final info = restaurantInfo[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomCard(
                  imageUrl: info.url ?? '',
                  title: info.title ?? '',
                  description: info.description ?? '',
                  rating: info.rating ?? 0.0,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
