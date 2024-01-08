import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import 'shimmer.dart';

class YbBoxesShimmer extends StatelessWidget {
  const YbBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: YbShimmerEffect(width: 150, height: 110)),
            SizedBox(width: YbSizes.spaceBtwItems),
            Expanded(child: YbShimmerEffect(width: 150, height: 110)),
            SizedBox(width: YbSizes.spaceBtwItems),
            Expanded(child: YbShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
