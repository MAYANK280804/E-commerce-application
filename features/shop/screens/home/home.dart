import 'package:YumeBazaar/features/shop/controllers/product/cart_controller.dart';
import 'package:YumeBazaar/features/shop/controllers/product/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../data/repositories/product/product_repository.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/device/device_utility.dart';
import '../all_products/all_products.dart';
import 'widgets/header_categories.dart';
import 'widgets/header_search_container.dart';
import 'widgets/home_appbar.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    Get.put(CartController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const YbPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Appbar
                  YbHomeAppBar(),
                  SizedBox(height: YbSizes.spaceBtwSections),

                  /// -- Searchbar
                  YbSearchContainer(text: 'Search in Store', showBorder: false),
                  SizedBox(height: YbSizes.spaceBtwSections),

                  /// -- Categories
                  YbHeaderCategories(),
                  SizedBox(height: YbSizes.spaceBtwSections * 2),
                ],
              ),
            ),

            /// -- Body
            Container(
              padding: const EdgeInsets.all(YbSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Promo Slider 1
                  const YbPromoSlider(),
                  const SizedBox(height: YbSizes.spaceBtwSections),

                  /// -- Popular Products
                  YbSectionHeading(
                    title: YbTexts.popularProducts,
                    onPressed: () => Get.to(
                      () => AllProducts(
                        title: YbTexts.popularProducts,
                        future: ProductRepository.instance.getAllFeaturedProducts(),
                      ),
                    ),
                  ),
                  const SizedBox(height: YbSizes.spaceBtwItems),

                  Obx(
                    () {
                      // Check if categories are still loading
                      if (controller.isLoading.value) return const YbVerticalProductShimmer();

                      // Check if there are no featured categories found
                      if (controller.featuredProducts.isEmpty) {
                        return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
                      } else {
                        /// Record Found! 🎊
                        return YbGridLayout(
                          itemCount: controller.featuredProducts.length,
                          itemBuilder: (_, index) => YbProductCardVertical(product: controller.featuredProducts[index], isNetworkImage: true),
                        );
                      }
                    },
                  ),

                  SizedBox(height: YbDeviceUtils.getBottomNavigationBarHeight() + YbSizes.defaultSpace),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
