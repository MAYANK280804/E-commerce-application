import 'package:YumeBazaar/common/widgets/products/cart/cart_menu_icon.dart';

import 'package:YumeBazaar/features/personalization/screens/setting/about_us.dart';
// import 'package:YumeBazaar/features/personalization/screens/setting/upload_data.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../home_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../shop/screens/cart/cart.dart';
import '../../../shop/screens/order/order.dart';
import '../../controllers/user_controller.dart';
import '../address/address.dart';
import '../profile/profile.dart';
// import 'upload_data.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return PopScope(
      canPop: false,

      // Intercept the back button press and redirect to Home Screen

      onPopInvoked: (value) async => Get.offAll(const HomeMenu()),

      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// -- Header

              YbPrimaryHeaderContainer(
                child: Column(
                  children: [
                    /// AppBar

                    YbAppBar(
                      title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: YbColors.white)),
                      actions: const [YbCartCounterIcon()],
                    ),

                    /// User Profile Card

                    YbUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),

                    const SizedBox(height: YbSizes.spaceBtwSections),
                  ],
                ),
              ),

              /// -- Profile Body

              Padding(
                padding: const EdgeInsets.all(YbSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// -- Account  Settings

                    const YbSectionHeading(title: 'Account Settings', showActionButton: false),

                    const SizedBox(height: YbSizes.spaceBtwItems),

                    YbSettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Addresses',
                      subTitle: 'Set shopping delivery address',
                      onTap: () => Get.to(() => const UserAddressScreen()),
                    ),

                    YbSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout',
                      onTap: () => Get.to(() => const CartScreen()),
                    ),

                    YbSettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subTitle: 'In-progress and Completed Orders',
                      onTap: () => Get.to(() => const OrderScreen()),
                    ),

                    const YbSettingsMenuTile(icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account'),

                    const YbSettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discounted coupons'),

                    YbSettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification message', onTap: () {}),

                    const YbSettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts'),

                    /// -- App Settings

                    const SizedBox(height: YbSizes.spaceBtwSections),

                    const YbSectionHeading(title: 'App Settings', showActionButton: false),

                    const SizedBox(height: YbSizes.spaceBtwItems),

                    // YbSettingsMenuTile(
                    //   icon: Iconsax.document_upload,
                    //   title: 'Load Data',
                    //   subTitle: 'Upload Data to your Cloud Firebase',
                    //   onTap: () => Get.to(() => const UploadDataScreen()),
                    // ),

                    const SizedBox(height: YbSizes.spaceBtwItems),

                    YbSettingsMenuTile(
                      icon: Iconsax.location,
                      title: 'Geolocation',
                      subTitle: 'Set recommendation based on location',
                      trailing: Switch(value: true, onChanged: (value) {}),
                    ),

                    YbSettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: 'Safe Mode',
                      subTitle: 'Search result is safe for all ages',
                      trailing: Switch(value: false, onChanged: (value) {}),
                    ),

                    // YbSettingsMenuTile(
                    //   icon: Iconsax.image,
                    //   title: 'HD Image Quality',
                    //   subTitle: 'Set image quality to be seen',
                    //   trailing: Switch(value: false, onChanged: (value) {}),
                    // ),

                    YbSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'About Us',
                      subTitle: 'Developers Informations',
                      onTap: () => Get.to(() => const AboutUs()),
                    ),

                    /// -- Logout Button

                    const SizedBox(height: YbSizes.spaceBtwSections),

                    SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => controller.logout(), child: const Text('Logout'))),

                    const SizedBox(height: YbSizes.spaceBtwSections * 2.5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*
// import 'package:YumeBazaar/features/personalization/screens/setting/developer_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../home_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../shop/screens/cart/cart.dart';
import '../../../shop/screens/order/order.dart';
import '../../controllers/user_controller.dart';
import '../address/address.dart';
import '../profile/profile.dart';
// import 'upload_data.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(const HomeMenu());
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// -- Header
              YbPrimaryHeaderContainer(
                child: Column(
                  children: [
                    /// AppBar
                    YbAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: YbColors.white))),

                    /// User Profile Card
                    YbUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                    const SizedBox(height: YbSizes.spaceBtwSections),
                  ],
                ),
              ),

              /// -- Profile Body
              Padding(
                padding: const EdgeInsets.all(YbSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// -- Account  Settings
                    const YbSectionHeading(title: 'Account Settings', showActionButton: false),
                    const SizedBox(height: YbSizes.spaceBtwItems),
                    YbSettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Addresses',
                      subTitle: 'Set shopping delivery address',
                      onTap: () => Get.to(() => const UserAddressScreen()),
                    ),
                    YbSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout',
                      onTap: () => Get.to(() => const CartScreen()),
                    ),
                    YbSettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subTitle: 'In-progress and Completed Orders',
                      onTap: () => Get.to(() => const OrderScreen()),
                    ),
                    const YbSettingsMenuTile(icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account'),
                    const YbSettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discounted coupons'),
                    YbSettingsMenuTile(
                        icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification message', onTap: () {}),
                    const YbSettingsMenuTile(
                        icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts'),

                    /// -- App Settings
                    const SizedBox(height: YbSizes.spaceBtwSections),
                    const YbSectionHeading(title: 'App Settings', showActionButton: false),
                    const SizedBox(height: YbSizes.spaceBtwItems),
                    // YbSettingsMenuTile(
                    //   icon: Iconsax.document_upload,
                    //   title: 'Load Data',
                    //   subTitle: 'Upload Data to your Cloud Firebase',
                    //   onTap: () => Get.to(() => const UploadDataScreen()),
                    // ),

                    // YbSettingsMenuTile(
                    //   icon: Iconsax.document_upload,
                    //   title: 'Load Data',
                    //   subTitle: 'Upload Data to your Cloud Firebase',
                    //   onTap: () => Get.to(() => const DeveloperInfoScreen()),
                    // ),
                    const SizedBox(height: YbSizes.spaceBtwItems),
                    YbSettingsMenuTile(
                      icon: Iconsax.location,
                      title: 'Geolocation',
                      subTitle: 'Set recommendation based on location',
                      trailing: Switch(value: true, onChanged: (value) {}),
                    ),
                    YbSettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: 'Safe Mode',
                      subTitle: 'Search result is safe for all ages',
                      trailing: Switch(value: false, onChanged: (value) {}),
                    ),
                    YbSettingsMenuTile(
                      icon: Iconsax.image,
                      title: 'HD Image Quality',
                      subTitle: 'Set image quality to be seen',
                      trailing: Switch(value: false, onChanged: (value) {}),
                    ),

                    /// -- Logout Button
                    const SizedBox(height: YbSizes.spaceBtwSections),
                    SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => controller.logout(), child: const Text('Logout'))),
                    const SizedBox(height: YbSizes.spaceBtwSections * 2.5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/