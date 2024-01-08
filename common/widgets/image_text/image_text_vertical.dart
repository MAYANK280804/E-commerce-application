import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
// import '../../../utils/helpers/helper_functions.dart';
import '../images/t_circular_image.dart';
import '../texts/t_brand_title_text.dart';

/// A widget that displays an image with text below it in a vertical arrangement.
class YbVerticalImageAndText extends StatelessWidget {
  /// Constructor for [YbVerticalImageAndText].
  const YbVerticalImageAndText({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    this.backgroundColor,
    this.isNetworkImage = true,
    this.textColor = YbColors.white,
  });

  /// The image asset path or URL.
  final String image;

  /// The text to be displayed below the image.
  final String title;

  /// The color of the text.
  final Color textColor;

  /// Flag indicating whether the image is loaded from the network.
  final bool isNetworkImage;

  /// The background color of the widget.
  final Color? backgroundColor;

  /// Callback function when the widget is tapped.
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: YbSizes.spaceBtwItems),
        child: Column(
          children: [
            YbCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: YbSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              // overlayColor: YbHelperFunctions.isDarkMode(context) ? YbColors.light : YbColors.dark,
            ),
            const SizedBox(height: YbSizes.spaceBtwItems / 2),
            SizedBox(width: 55, child: YbBrandTitleText(title: title, color: textColor)),
          ],
        ),
      ),
    );
  }
}
