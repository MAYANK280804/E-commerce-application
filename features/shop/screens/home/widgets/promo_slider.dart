import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../common/widgets/shimmers/shimmer.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product/banner_controller.dart';

/// Widget to display a promo slider using GetX state management.
class YbPromoSlider extends StatelessWidget {
  const YbPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    // Get instance of BannerController using GetX
    final controller = Get.put(BannerController());

    // Use Obx widget to automatically rebuild the UI when banners state changes
    return Obx(
      () {
        // Loader
        if (controller.bannersLoading.value) return const YbShimmerEffect(width: double.infinity, height: 190);

        // No data found
        if (controller.banners.isEmpty) {
          return const Center(child: Text('No Data Found!'));
        } else {
          /// Record Found! 🎊
          // Display CarouselSlider with banners and page indicator
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) => controller.updatePageIndicator(index),
                  autoPlay: true,
                ),
                items: controller.banners
                    .map((banner) => YbRoundedImage(
                          imageUrl: banner.imageUrl,
                          isNetworkImage: true,
                          // onPressed: () => Get.toNamed(banner.targetScreen),
                        ))
                    .toList(),
              ),
              const SizedBox(height: YbSizes.spaceBtwItems),
              Center(
                child: Obx(
                  () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Display page indicators based on the number of banners
                      for (int i = 0; i < controller.banners.length; i++)
                        YbCircularContainer(
                          width: 20,
                          height: 4,
                          margin: const EdgeInsets.only(right: 10),
                          backgroundColor: controller.carousalCurrentIndex.value == i ? YbColors.primary : YbColors.grey,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}