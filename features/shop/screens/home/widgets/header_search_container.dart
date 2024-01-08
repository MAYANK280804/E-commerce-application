import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../search/search.dart';

class YbSearchContainer extends StatelessWidget {
  const YbSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: YbSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = YbHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => SearchScreen()),
      child: Padding(
        padding: padding,
        child: Container(
          width: YbDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(YbSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? YbColors.dark
                    : YbColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(YbSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: YbColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: dark ? YbColors.darkerGrey : Colors.grey),
              const SizedBox(width: YbSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
