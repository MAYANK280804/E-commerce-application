import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../../features/authentication/controllers/login_in_controller.dart';

import '../../../utils/constants/colors.dart';

import '../../../utils/constants/image_strings.dart';

import '../../../utils/constants/sizes.dart';


class YbSocialButtons extends StatelessWidget {

  const YbSocialButtons({super.key});


  @override

  Widget build(BuildContext context) {

    final controller = Get.put(LoginController());

    return Row(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        /// Google Button

        Container(

          padding: const EdgeInsets.all(YbSizes.xs),

          decoration: BoxDecoration(border: Border.all(color: YbColors.grey), borderRadius: BorderRadius.circular(100)),

          child: IconButton(

            onPressed: () => controller.googleSignIn(),

            icon: const Image(width: YbSizes.iconMd + 4, height: YbSizes.iconMd + 4, image: AssetImage(YbImages.google)),

          ),

        ),

        const SizedBox(width: YbSizes.spaceBtwItems),


        /// Facebook Button

        // Container(

        //   padding: const EdgeInsets.all(YbSizes.xs),

        //   decoration: BoxDecoration(border: Border.all(color: YbColors.grey), borderRadius: BorderRadius.circular(100)),

        //   child: IconButton(

        //     onPressed: () => controller.facebookSignIn(),

        //     icon: const Image(width: YbSizes.iconMd + 4, height: YbSizes.iconMd + 4, image: AssetImage(YbImages.facebook)),

        //   ),

        // ),

      ],

    );

  }

}

