import 'package:flash_delivery_app/widgets/custom_card_carts.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_bar/appbar_title.dart';
import '../Home_screen/models/restaurant_card_model.dart';

class CartsScreen extends StatelessWidget {
  final List<RestaurantCardModel> restaurantList;

  const CartsScreen({super.key,required this.restaurantList});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: AppbarTitle(
          text: 'Carts',
          margin: const EdgeInsets.only(top: 8.0, right: 16.0),
          onTap: () {
            // Handle onTap action if needed
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: restaurantList.length,
              itemBuilder: (context, index) {
                final info = restaurantList[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  child: CustomCardCart(
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
      ),
    );
  }
}
