import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/t_circular_icon.dart';

class YbProductQuantityWithAddRemoveButton extends StatelessWidget {
  const YbProductQuantityWithAddRemoveButton({
    super.key,
    required this.add,
    this.width = 40,
    this.height = 40,
    this.iconSize,
    required this.remove,
    required this.quantity,
    this.addBackgroundColor = YbColors.black,
    this.removeBackgroundColor = YbColors.darkGrey,
    this.addForegroundColor = YbColors.white,
    this.removeForegroundColor = YbColors.white,
  });

  final VoidCallback? add, remove;
  final int quantity;
  final double width, height;
  final double? iconSize;
  final Color addBackgroundColor, removeBackgroundColor;
  final Color addForegroundColor, removeForegroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        YbCircularIcon(
          icon: Iconsax.minus_cirlce5,
          onPressed: remove,
          width: width,
          height: height,
          size: iconSize,
          color: removeForegroundColor,
          backgroundColor: removeBackgroundColor,
        ),
        const SizedBox(width: YbSizes.spaceBtwItems),
        Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: YbSizes.spaceBtwItems),
        YbCircularIcon(
          icon: Iconsax.add_circle5,
          onPressed: add,
          width: width,
          height: height,
          size: iconSize,
          color: addForegroundColor,
          backgroundColor: addBackgroundColor,
        ),
      ],
    );
  }
}
