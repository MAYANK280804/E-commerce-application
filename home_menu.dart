// import 'package:YumeBazaar/features/shop/screens/cart/cart.dart';
// import 'package:YumeBazaar/utils/constants/colors.dart';
// import 'package:YumeBazaar/utils/helpers/helper_functions.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// import 'features/personalization/screens/setting/settings.dart';
// import 'features/shop/screens/favourites/favourite.dart';
// import 'features/shop/screens/home/home.dart';
// import 'features/shop/screens/store/store.dart';

// class HomeMenu extends StatelessWidget {
//   const HomeMenu({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(AppScreenController());
//     return Scaffold(
//       extendBody: true,
//       bottomNavigationBar: Obx(
//         () => NavigationBar(
//           height: 80,
//           animationDuration: const Duration(seconds: 3),
//           selectedIndex: controller.selectedMenu.value,
//           backgroundColor: YbHelperFunctions.isDarkMode(context) ? YbColors.black : Colors.white,
//           elevation: 0,
//           indicatorColor: YbHelperFunctions.isDarkMode(context) ? YbColors.white.withOpacity(0.1) : YbColors.black.withOpacity(0.1),
//           onDestinationSelected: (index) => controller.selectedMenu.value = index,
//           destinations: const [
//             NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
//             NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
//             NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
//             NavigationDestination(icon: Icon(Iconsax.shopping_cart), label: 'Cart'),
//             NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
//           ],
//         ),
//       ),
//       body: Obx(() => controller.screens[controller.selectedMenu.value]),
//     );
//   }
// }

// class AppScreenController extends GetxController {
//   static AppScreenController get instance => Get.find();

//   final Rx<int> selectedMenu = 0.obs;

//   final screens = [const HomeScreen(), const StoreScreen(), const FavouriteScreen(), const CartScreen(), const SettingsScreen()];
// }

import 'package:YumeBazaar/features/personalization/screens/setting/settings.dart';
import 'package:YumeBazaar/features/shop/screens/cart/cart.dart';
import 'package:YumeBazaar/features/shop/screens/favourites/favourite.dart';
import 'package:YumeBazaar/features/shop/screens/home/home.dart';
import 'package:YumeBazaar/features/shop/screens/store/store.dart';
import 'package:YumeBazaar/utils/constants/colors.dart';
import 'package:YumeBazaar/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppScreenController());

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        index: controller.selectedMenu.value,
        height: 56.0,
        items: const [
          Icon(Iconsax.home5, size: 30, color: Colors.white),
          Icon(Iconsax.shop5, size: 30, color: Colors.white),
          Icon(Iconsax.heart5, size: 30, color: Colors.white),
          Icon(Iconsax.shopping_cart5, size: 30, color: Colors.white),
          Icon(Iconsax.user_octagon, size: 30, color: Colors.white),
        ],
        color: YbHelperFunctions.isDarkMode(context) ? YbColors.primary : YbColors.primary,
        buttonBackgroundColor: YbHelperFunctions.isDarkMode(context) ? YbColors.accent : YbColors.accent,
        // backgroundColor: YbHelperFunctions.isDarkMode(context) ? Colors.white10 : Colors.black12,
        backgroundColor: YbHelperFunctions.isDarkMode(context) ? Colors.white10.withOpacity(0) : Colors.black12.withOpacity(0),

        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 800),
        onTap: (index) {
          controller.selectedMenu.value = index;
        },
      ),
      body: Obx(() => controller.screens[controller.selectedMenu.value]),
    );
  }
}

class AppScreenController extends GetxController {
  static AppScreenController get instance => Get.find();

  final Rx<int> selectedMenu = 0.obs;

  final screens = [const HomeScreen(), const StoreScreen(), const FavouriteScreen(), const CartScreen(), const SettingsScreen()];
}
