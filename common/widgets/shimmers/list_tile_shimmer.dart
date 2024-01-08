import 'package:flutter/material.dart';
import 'shimmer.dart';

import '../../../utils/constants/sizes.dart';

class YbListTileShimmer extends StatelessWidget {
  const YbListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            YbShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: YbSizes.spaceBtwItems),
            Column(
              children: [
                YbShimmerEffect(width: 100, height: 15),
                SizedBox(height: YbSizes.spaceBtwItems / 2),
                YbShimmerEffect(width: 80, height: 12),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
