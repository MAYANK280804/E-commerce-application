import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import 'shimmer.dart';

class YbSearchCategoryShimmer extends StatelessWidget {
  const YbSearchCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        separatorBuilder: (_, __) => const SizedBox(width: YbSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              YbShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: YbSizes.spaceBtwItems / 2),

              /// Text
              YbShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
