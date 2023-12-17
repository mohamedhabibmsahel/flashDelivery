import 'package:flash_delivery_app/Lists_for_test/list_of_test.dart';
import 'package:flash_delivery_app/presentation/Home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';


import '../../presentation/Carts_screen/carts_screen.dart';
import '../../presentation/Login_screen/login_screen.dart';
import '../../presentation/Settings_screen/settings_screen.dart';
import '../../presentation/View_all_screen/view_all_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () =>  NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
          NavigationDestination(icon: Icon(Iconsax.heart), label: 'WishList'),
          NavigationDestination(icon: Icon(Iconsax.shopping_cart), label: 'Carts'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),

        ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [ HomeScreen(),const LoginScreen(), ViewAllScreen(restaurantList: restaurantInfo), CartsScreen(restaurantList: restaurantInfo), SettingsScreen()];
}
