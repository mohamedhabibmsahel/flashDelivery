import 'package:flash_delivery_app/presentation/Settings_screen/widgets/custom_settings_title.dart';
import 'package:flash_delivery_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_bar/appbar_title.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: AppbarTitle(
          text: 'Settings',
          margin: const EdgeInsets.only(top: 8.0, right: 16.0),
          onTap: () {
            // Handle onTap action if needed
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Account Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SettingsTile(
              title: 'Profile',
              icon: Icons.person,
              onTap: () {
                // Handle navigation to the profile screen
              },
            ),
            SettingsTile(
              title: 'Payment Methods',
              icon: Icons.credit_card,
              onTap: () {
                // Handle navigation to the payment methods screen
              },
            ),
            const Divider(),
            const Text(
              'App Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SettingsTile(
              title: 'Notifications',
              icon: Icons.notifications,
              onTap: () {
                // Handle navigation to the notifications settings screen
              },
            ),
            SettingsTile(
              title: 'Appearance',
              icon: Icons.palette,
              onTap: () {
                // Handle navigation to the appearance settings screen
              },
            ),
            const Divider(),
            CustomButton(
              backgroundColor: Colors.black,
              titleColor: Colors.white,
              title: "Sign Out",
              onPressed: () {
                // Handle sign-out logic
              },
            )
          ],
        ),
      ),
    );
  }
}
