import 'package:flash_delivery_app/presentation/Home_screen/widgets/restaurantSection_widget.dart';
import 'package:flutter/material.dart';

import '../../Lists_for_test/list_of_test.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_icon_circle.dart';
import '../../widgets/custom_grey_line.dart';
import '../../widgets/custom_search_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> imageInfo = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: AppbarTitle(
          text: 'Home',
          margin: const EdgeInsets.only(top: 8.0, right: 16.0),
          onTap: () {
            // Handle onTap action if needed
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSearchView(
                onChanged: (value) {
                  // Handle search input changes if needed
                },
              ),
            ),
            SizedBox(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageInfo.length,
                itemBuilder: (context, index) {
                  final info = imageInfo[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularImageWidget(
                      imageUrl: info['url'] ?? '',
                      title: info['title'] ?? '',
                    ),
                  );
                },
              ),
            ),
            const GreyLine(),
            RestaurantSection(title:"Stores near you",restaurantInfo: restaurantInfo),
            const GreyLine(),
            RestaurantSection(title:"Featured Restaurants",restaurantInfo: restaurantInfo),
            const GreyLine(),
            RestaurantSection(title:"top 10 Restaurants",restaurantInfo: restaurantInfo),
            const GreyLine(),
            // Add more RestaurantSection widgets as needed
          ],
        ),
      ),
    );
  }

}
