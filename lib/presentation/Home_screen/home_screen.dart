import 'package:flash_delivery_app/presentation/Home_screen/widgets/restaurantSection_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Lists_for_test/pirceoption.dart';
import '../../widgets/Custom_circular_image_view.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/custom_filter_chip.dart';
import '../../widgets/custom_grey_line.dart';
import '../../widgets/custom_radio_bottom_sheet.dart';
import '../../widgets/custom_recipe_card.dart';
import '../../widgets/custom_search_view.dart';
import 'bloc/HomeController.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                itemCount: _homeController.imageInfo.length,
                itemBuilder: (context, index) {
                  final info = _homeController.imageInfo[index];
                  bool isSelected = index  == _homeController.selectedItemIndex.value;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: isSelected ? _homeController.parseColor(info['Color'] ?? '').withOpacity(0.5) : Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: CustomCircularImageView(
                            height: 50,
                            fit: BoxFit.fill,
                            imagePath: info['url'],
                              onTap: () {
                                print('Item tapped: $index');
                                print(_homeController.selectedItemIndex);
                                setState(() {
                                  if (index == _homeController.selectedItemIndex.value) {
                                    // If the tapped index is the same as the selected index, deselect it
                                    _homeController.setSelectedItemIndex(-1);
                                  } else {
                                    // Otherwise, select the tapped index
                                    _homeController.setSelectedItemIndex(index);
                                  }                                });
                                print(_homeController.selectedItemIndex);
                              },
                          ),
                        ),
                        Text(
                          info['title'] ?? '',
                          style: const TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomFilterChip(
                      label: const Text('Delivery time'),
                      content: Text("Delivery Time"),
                      selected:
                          _homeController.isFilterDeliveryTimeSelected.value,
                      onSelected: _homeController.handleFilterDeliveryTime,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomFilterChip(
                      label: const Text('Delivery fee'),
                      content: CustomSliderBottomSheet(
                        title: 'Delivery fee',
                        initialValue: 5.0,
                        divisions: _homeController.divisions,
                        button1Label: 'Apply',
                        button2Label: 'Reset',
                      ),
                      selected:
                          _homeController.isFilterDeliveryFeeSelected.value,
                      onSelected: (bool selected) {
                        // Handle selection
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomFilterChip(
                      label: const Text('Sort by'),
                      content: CustomRadioBottomSheet(
                        title: 'Sort by',
                        options: _homeController.deliveryTimeList,
                        initialSelectedOption: "",
                        button1Label: 'Apply',
                        button2Label: 'Reset',
                      ),
                      selected: _homeController.isFilterSelected.value,
                      onSelected: (bool selected) {
                        _homeController.isFilterSelected.value = selected;
                        if (selected) {
                          // showBottomSheet(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const GreyLine(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Stores",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
            RecipeCard(
              title: 'My recipe',
              rating: '4.9',
              cookTime: '30 min',
              thumbnailUrl:
                  'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
            ),
            RecipeCard(
              title: 'My recipe',
              rating: '4.9',
              cookTime: '30 min',
              thumbnailUrl:
                  'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
            ),
            const GreyLine(),
            RestaurantSection(
                title: "Stores near you",
                restaurantInfo: _homeController.restaurantInfo),
            const GreyLine(),
            RestaurantSection(
                title: "Featured Restaurants",
                restaurantInfo: _homeController.restaurantInfo),
            const GreyLine(),
            RestaurantSection(
                title: "top 10 Restaurants",
                restaurantInfo: _homeController.restaurantInfo),
            const GreyLine(),
            // Add more RestaurantSection widgets as needed
          ],
        ),
      ),
    );
  }
}
