import 'package:flash_delivery_app/presentation/Restaurant_screen/models/menu.dart';
import 'package:flash_delivery_app/presentation/Restaurant_screen/widgets/menu_card.dart';
import 'package:flash_delivery_app/presentation/Restaurant_screen/widgets/restaruant_categories.dart';
import 'package:flash_delivery_app/presentation/Restaurant_screen/widgets/restaurant_info.dart';
import 'package:flutter/material.dart';
import '../../widgets/app_bar/appbar_restaurant.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  final scrollController = ScrollController();
  int selectedCategoryIndex = 0;
  double restaurantInfoHeight = 200 + 170 - kToolbarHeight;

  @override
  void initState() {
    createBreackPoints();
    scrollController.addListener(() {
      updateCategoryIndexOnScroll(scrollController.offset);
    });
    super.initState();
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollToCategory(int index) {
    if (selectedCategoryIndex != index) {
      int totalItems = 0;
      for (var i = 0; i < index; i++) {
        totalItems += demoCategoryMenus[i].items.length;
      }
      scrollController.animateTo(
          restaurantInfoHeight + (116 * totalItems) + (50 * index),
          duration: Duration(microseconds: 500),
          curve: Curves.ease);
      setState(() {
        selectedCategoryIndex = index;
      });
    }
  }

  List<double> breackPoints = [];

  void createBreackPoints() {
    double firstBreackPoint =
        restaurantInfoHeight + 50 + (116 * demoCategoryMenus[0].items.length);
    breackPoints.add(firstBreackPoint);
    for (var i = 1; i < demoCategoryMenus.length; i++) {
      double breackPoint =
          breackPoints.last + 50 + (116 * demoCategoryMenus[i].items.length);
      breackPoints.add(breackPoint);
    }
  }

  void updateCategoryIndexOnScroll(double offset) {
    for (var i = 0; i < demoCategoryMenus.length; i++) {
      if (i == 0) {
        if ((offset < breackPoints.first) & (selectedCategoryIndex != 0)) {
          setState(() {
            selectedCategoryIndex = 0;
          });
        }
      }
      else if((breackPoints[i-1]<= offset) & (offset < breackPoints[i])){
        if(selectedCategoryIndex != i){
          setState(() {
            selectedCategoryIndex = i;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          Appbar_restaurant(),
          SliverToBoxAdapter(
            child: RestaurantInfo(),
          ),
          SliverPersistentHeader(
            delegate: RestaurantCategories(
              onChanged: scrollToCategory,
              selectedIndex: selectedCategoryIndex,
            ),
            pinned: true,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, categoryIndex) {
                List<Menu> items = demoCategoryMenus[categoryIndex].items;
                return MenuCategoryItem(
                  title: demoCategoryMenus[categoryIndex].category,
                  items: List.generate(
                      items.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: MenuCard(
                                image: items[index].image,
                                title: items[index].title,
                                price: items[index].price),
                          )),
                );
              },
              childCount: demoCategoryMenus.length,
            )),
          )
        ],
      ),
    );
  }
}
