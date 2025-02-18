import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tinder/utils/constents/colors.dart';
import 'package:tinder/utils/helper/helper_functions.dart';

import 'features/personalization/screens/settings/settings.dart';
import 'features/shop/screens/home/home.dart';
import 'features/shop/screens/store/store.dart';
import 'features/shop/screens/wishlist/wishlist.dart';
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
          ()=> NavigationBar(
          height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index)=> controller.selectedIndex.value= index,
            backgroundColor: dark? TColors.black : Colors.white,
              indicatorColor: dark? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
            destinations: const[
               NavigationDestination(icon: Icon(Iconsax.home), label: 'home',),
              NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store',),
              NavigationDestination(icon: Icon(Iconsax.heart), label: 'WishList',),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile',),
            ]),
      ),
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}
class NavigationController extends GetxController{
  final Rx<int> selectedIndex =0.obs;
  final screens= [const HomeScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingsScreen()];
}
