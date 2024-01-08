import 'package:flutter/material.dart';
import '../layouts/grid_layout.dart';
import 'shimmer.dart';

class YbBrandsShimmer extends StatelessWidget {
  const YbBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return YbGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const YbShimmerEffect(width: 300, height: 80),
    );
  }
}
