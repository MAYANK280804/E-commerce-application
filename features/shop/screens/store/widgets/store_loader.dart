import 'package:flutter/material.dart';

import '../../../../../common/widgets/shimmers/boxes_shimmer.dart';
import '../../../../../common/widgets/shimmers/brands_shimmer.dart';
import '../../../../../common/widgets/shimmers/list_tile_shimmer.dart';
import '../../../../../common/widgets/shimmers/shimmer.dart';
import '../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../utils/constants/sizes.dart';

class TStoreShimmerLoader extends StatelessWidget {
  const TStoreShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(YbSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(height: YbSizes.spaceBtwSections),
            // AppBar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                YbShimmerEffect(width: 100, height: 15),
                YbShimmerEffect(width: 55, height: 55, radius: 55),
              ],
            ),
            SizedBox(height: YbSizes.spaceBtwSections * 2),
            // Search
            YbShimmerEffect(width: double.infinity, height: 55),
            SizedBox(height: YbSizes.spaceBtwSections),

            // Heading
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                YbShimmerEffect(width: 100, height: 15),
                YbShimmerEffect(width: 80, height: 12),
              ],
            ),
            SizedBox(height: YbSizes.spaceBtwSections),

            // Brands
            YbBrandsShimmer(),
            SizedBox(height: YbSizes.spaceBtwSections * 2),

            // Categories
            Row(
              children: [
                Expanded(child: YbShimmerEffect(width: 100, height: 15)),
                SizedBox(width: YbSizes.spaceBtwItems),
                Expanded(child: YbShimmerEffect(width: 100, height: 15)),
                SizedBox(width: YbSizes.spaceBtwItems),
                Expanded(child: YbShimmerEffect(width: 100, height: 15)),
                SizedBox(width: YbSizes.spaceBtwItems),
                Expanded(child: YbShimmerEffect(width: 100, height: 15)),
              ],
            ),
            SizedBox(height: YbSizes.spaceBtwSections),

            // Category Brands
            YbListTileShimmer(),
            SizedBox(height: YbSizes.spaceBtwSections),
            YbBoxesShimmer(),
            SizedBox(height: YbSizes.spaceBtwSections),

            // Products
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                YbShimmerEffect(width: 100, height: 15),
                YbShimmerEffect(width: 80, height: 12),
              ],
            ),
            SizedBox(height: YbSizes.spaceBtwSections),

            YbVerticalProductShimmer(),
            SizedBox(height: YbSizes.spaceBtwSections * 3),
          ],
        ),
      ),
    );
  }
}
