import 'package:get/get.dart';

import '../models/restaurant_card_model.dart';

class HomeController extends GetxController {
  RxList<String> deliveryTimeList = ["Recommended", "Rating", "Delivery time"].obs;
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
      'title': 'Pizza'
    },
    {
      'url': 'https://icons.iconarchive.com/icons/iconarchive/fat-sugar-food/512/Pizza-icon.png',
      'title': 'Pizza'
    },
    {
      'url': 'https://icons.iconarchive.com/icons/iconarchive/fat-sugar-food/512/Pizza-icon.png',
      'title': 'Pizza'
    },
    {
      'url': 'https://icons.iconarchive.com/icons/iconarchive/fat-sugar-food/512/Pizza-icon.png',
      'title': 'Pizza'
    },
    {
      'url': 'https://icons.iconarchive.com/icons/iconarchive/fat-sugar-food/512/Pizza-icon.png',
      'title': 'Pizza'
    },
    {
      'url': 'https://icons.iconarchive.com/icons/iconarchive/fat-sugar-food/512/Pizza-icon.png',
      'title': 'Pizza'
    },
    {
      'url': 'https://icons.iconarchive.com/icons/iconarchive/fat-sugar-food/512/Pizza-icon.png',
      'title': 'Pizza'
    },
    {
      'url': 'https://icons.iconarchive.com/icons/iconarchive/fat-sugar-food/512/Pizza-icon.png',
      'title': 'Pizza'
    },
  ].obs;

  RxBool isFilterDeliveryTimeSelected = false.obs;
  RxBool isFilterDeliveryFeeSelected = false.obs;
  RxBool isFilterSelected = false.obs;


  void handleFilterDeliveryTime(bool selected) {
    isFilterDeliveryTimeSelected.value = selected;
    // Handle additional logic if needed
  }
}
