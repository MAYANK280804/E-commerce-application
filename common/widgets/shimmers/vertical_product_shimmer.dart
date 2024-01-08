import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import '../layouts/grid_layout.dart';
import 'shimmer.dart';

class YbVerticalProductShimmer extends StatelessWidget {
  const YbVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return YbGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            YbShimmerEffect(width: 180, height: 180),
            SizedBox(height: YbSizes.spaceBtwItems),

            /// Text
            YbShimmerEffect(width: 160, height: 15),
            SizedBox(height: YbSizes.spaceBtwItems / 2),
            YbShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
