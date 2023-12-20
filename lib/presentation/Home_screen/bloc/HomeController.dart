import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/restaurant_card_model.dart';

class HomeController extends GetxController {
  RxList<String> deliveryTimeList = ["Recommended", "Rating", "Delivery time"].obs;
  RxList<double> divisions = [0.0, 3.0, 7.0].obs;
  RxInt selectedItemIndex = (-1).obs;

  RxList<RestaurantCardModel> restaurantInfo = [
    RestaurantCardModel('Pizza',
      'Delicious pizza with fresh toppings.',
      'https://t3.ftcdn.net/jpg/03/24/73/92/360_F_324739203_keeq8udvv0P2h1MLYJ0GLSlTBagoXS48.jpg',
      4.5,
    ),
    RestaurantCardModel('KFC',
      'Another tasty pizza option.',
      'https://t3.ftcdn.net/jpg/05/41/62/96/240_F_541629636_RlfZtQI6uIOW9Uj52x6HpczOlFNVps4L.jpg',
      2.3,
    ),
    RestaurantCardModel('MCDonalds',
      'Another tasty pizza option.',
      'https://pembrokeshire-herald.com/wp-content/uploads/2022/07/mcdonalds.jpeg',
      2.3,
    ),

    RestaurantCardModel('Pizza',
      'Delicious pizza with fresh toppings.',
      'https://t3.ftcdn.net/jpg/03/24/73/92/360_F_324739203_keeq8udvv0P2h1MLYJ0GLSlTBagoXS48.jpg',
      4.5,
    ),
    RestaurantCardModel('KFC',
      'Another tasty pizza option.',
      'https://t3.ftcdn.net/jpg/05/41/62/96/240_F_541629636_RlfZtQI6uIOW9Uj52x6HpczOlFNVps4L.jpg',
      2.3,
    ),
    RestaurantCardModel('MCDonalds',
      'Another tasty pizza option.',
      'https://pembrokeshire-herald.com/wp-content/uploads/2022/07/mcdonalds.jpeg',
      2.3,
    ),

    RestaurantCardModel('Pizza',
      'Delicious pizza with fresh toppings.',
      'https://t3.ftcdn.net/jpg/03/24/73/92/360_F_324739203_keeq8udvv0P2h1MLYJ0GLSlTBagoXS48.jpg',
      4.5,
    ),
    RestaurantCardModel('KFC',
      'Another tasty pizza option.',
      'https://t3.ftcdn.net/jpg/05/41/62/96/240_F_541629636_RlfZtQI6uIOW9Uj52x6HpczOlFNVps4L.jpg',
      2.3,
    ),
    RestaurantCardModel('MCDonalds',
      'Another tasty pizza option.',
      'https://pembrokeshire-herald.com/wp-content/uploads/2022/07/mcdonalds.jpeg',
      2.3,
    ),
  ].obs;
  RxList<Map<String, String>> imageInfo = [
    {
      'url': 'https://icons.iconarchive.com/icons/iconarchive/fat-sugar-food/512/Pizza-icon.png',
      'title': 'Pizza',
      'Color': '0xFFFFFF5C',
    },
    {
      'url': 'https://icons.iconarchive.com/icons/google/noto-emoji-food-drink/256/32408-sushi-icon.png',
      'title': 'Sushi',
      'Color': '0xFF65745C',
    },
    {
      'url': 'https://icons.iconarchive.com/icons/pixelkit/tasty-bites/256/hamburger-icon.png',
      'title': 'Burger',
      'Color': '0xFFFFB52E',
    },
    {
      'url': 'https://icons.iconarchive.com/icons/google/noto-emoji-food-drink/256/32387-taco-icon.png',
      'title': 'Tacos',
      'Color': '0xFFF0E68C',
    },
    {
      'url': 'https://icons.iconarchive.com/icons/google/noto-emoji-food-drink/256/32395-green-salad-icon.png',
      'title': 'Salad',
      'Color': '0xFF2BB02B',
    },
    {
      'url': 'https://icons.iconarchive.com/icons/google/noto-emoji-food-drink/256/32405-spaghetti-icon.png',
      'title': 'Plats',
      'Color': '0xFFF6C324',
    },
    {
      'url': 'https://icons.iconarchive.com/icons/martin-berube/food/256/soda-icon.png',
      'title': 'Smoothies',
      'Color': '0xFF6D0E10',
    },
    {
      'url': 'https://icons.iconarchive.com/icons/google/noto-emoji-animals-nature/256/22301-shrimp-icon.png',
      'title': 'SeaFood',
      'Color': '0xFFE32227',
    },
  ].obs;


  RxBool isFilterDeliveryTimeSelected = false.obs;
  RxBool isFilterDeliveryFeeSelected = false.obs;
  RxBool isFilterSelected = false.obs;
  RxBool isSelected = false.obs;


  void handleFilterDeliveryTime(bool selected) {
    isFilterDeliveryTimeSelected.value = selected;
    // Handle additional logic if needed
  }
  void setSelectedItemIndex(int index) {
    selectedItemIndex.value = index;
  }
  Color parseColor(String hexColor) {
    return Color(int.parse(hexColor));
  }
  void handleItemTap(int index) {
      if (index == selectedItemIndex.value) {
        // If the tapped index is the same as the selected index, deselect it
        setSelectedItemIndex(-1);
      } else {
        // Otherwise, select the tapped index
        setSelectedItemIndex(index);
      }
      update();
  }

}
