import 'package:flash_delivery_app/presentation/Home_screen/widgets/restaurantSection_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_icon_circle.dart';
import '../../widgets/custom_filter_chip.dart';
import '../../widgets/custom_grey_line.dart';
import '../../widgets/custom_radio_bottom_sheet.dart';
import '../../widgets/custom_search_view.dart';
import 'bloc/HomeController.dart';


class HomeScreen extends StatelessWidget {
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
                      selected: _homeController.isFilterDeliveryTimeSelected.value,
                      onSelected: _homeController.handleFilterDeliveryTime,
                    ),
                    const SizedBox(width: 10,),
                    CustomFilterChip(
                      label: const Text('Delivery fee'),
                      content: Text("Delivery fee"),
                      selected: _homeController.isFilterDeliveryFeeSelected.value,
                      onSelected: (bool selected) {
                        // Handle selection
                      },
                    ),
                    const SizedBox(width: 10,),
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
            const GreyLine(),
            RestaurantSection(title: "Stores near you", restaurantInfo: _homeController.restaurantInfo),
            const GreyLine(),
            RestaurantSection(title: "Featured Restaurants", restaurantInfo: _homeController.restaurantInfo),
            const GreyLine(),
            RestaurantSection(title: "top 10 Restaurants", restaurantInfo: _homeController.restaurantInfo),
            const GreyLine(),
            // Add more RestaurantSection widgets as needed
          ],
        ),
      ),
    );
  }
}
