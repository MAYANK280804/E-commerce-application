import 'package:flutter/material.dart';

import 'package:get/get.dart';

// import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';

import '../../../../common/widgets/images/t_circular_image.dart';

import '../../../../common/widgets/shimmers/shimmer.dart';

import '../../../../common/widgets/texts/section_heading.dart';

import '../../../../utils/constants/image_strings.dart';

import '../../../../utils/constants/sizes.dart';

import '../../controllers/user_controller.dart';

import 'change_name.dart';

import 'widgets/profile_menu.dart';


class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});


  @override

  Widget build(BuildContext context) {

    final controller = UserController.instance;

    return Scaffold(

      appBar: YbAppBar(

        showBackArrow: true,

        title: Text('Profile', style: Theme.of(context).textTheme.headlineSmall),

      ),

      body: SingleChildScrollView(

        child: Padding(

          padding: const EdgeInsets.all(YbSizes.defaultSpace),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              SizedBox(

                width: double.infinity,

                child: Column(

                  children: [

                    Obx(() {

                      final isNetworkImage = controller.user.value.profilePicture.isNotEmpty;

                      final image = isNetworkImage ? controller.user.value.profilePicture : YbImages.user;

                      const loader = YbShimmerEffect(width: 80, height: 80, radius: 80);

                      return controller.imageUploading.value

                          ? loader

                          : YbCircularImage(image: image, width: 80, height: 80, isNetworkImage: isNetworkImage);

                    }),

                    TextButton(

                        onPressed: controller.imageUploading.value ? () {} : () => controller.uploadUserProfilePicture(),

                        child: const Text('Change Profile Picture')),

                  ],

                ),

              ),

              const SizedBox(height: YbSizes.spaceBtwItems / 2),

              const Divider(),

              const SizedBox(height: YbSizes.spaceBtwItems),

              const YbSectionHeading(title: 'Profile Information', showActionButton: false),

              const SizedBox(height: YbSizes.spaceBtwItems),

              // YbProfileMenu(onPressed: () => Get.to(() => const ChangeName()), title: 'Name', value: controller.user.value.fullName),

              YbProfileMenu(onPressed: () => {}, title: 'Name', value: controller.user.value.fullName),

              YbProfileMenu(onPressed: () {}, title: 'Username', value: controller.user.value.username),

              const SizedBox(height: YbSizes.spaceBtwItems),

              const Divider(),

              const SizedBox(height: YbSizes.spaceBtwItems),

              const YbSectionHeading(title: 'Personal Information', showActionButton: false),

              const SizedBox(height: YbSizes.spaceBtwItems),

              // YbProfileMenu(onPressed: () {}, title: 'User ID', value: '45689', icon: Iconsax.copy),

              YbProfileMenu(onPressed: () {}, title: 'User ID', value: '45689'),

              YbProfileMenu(onPressed: () {}, title: 'E-mail', value: controller.user.value.email),

              YbProfileMenu(onPressed: () {}, title: 'Phone Number', value: controller.user.value.phoneNumber),

              // YbProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),

              // YbProfileMenu(onPressed: () {}, title: 'Date of Birth', value: '1 Jan, 1900'),

              const Divider(),

              const SizedBox(height: YbSizes.spaceBtwItems),

              // Center(

              //   child: TextButton(

              //       onPressed: () => controller.deleteAccountWarningPopup(), child: const Text('Close Account', style: TextStyle(color: Colors.red))),

              // )

              Center(

                child: TextButton(

                    onPressed: () => Get.to(() => const ChangeName()),

                    child: const Text('Edit Profile', style: TextStyle(color: Color.fromARGB(255, 66, 162, 206)))),

              )

            ],

          ),

        ),

      ),

    );

  }

}

