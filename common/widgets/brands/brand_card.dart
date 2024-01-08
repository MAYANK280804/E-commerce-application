import 'package:flutter/material.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/t_circular_image.dart';
import '../texts/t_brand_title_text_with_verified_icon.dart';

/// A card widget representing a brand.
class YbBrandCard extends StatelessWidget {
  /// Default constructor for the YbBrandCard.
  ///
  /// Parameters:
  ///   - brand: The brand model to display.
  ///   - showBorder: A flag indicating whether to show a border around the card.
  ///   - onTap: Callback function when the card is tapped.
  const YbBrandCard({
    super.key,
    required this.brand,
    required this.showBorder,
    this.onTap,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = YbHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,

      /// Container Design
      child: YbRoundedContainer(
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(YbSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// -- Icon
            Flexible(
              child: YbCircularImage(
                image: brand.image,
                isNetworkImage: true,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? YbColors.white : YbColors.black,
              ),
            ),
            const SizedBox(width: YbSizes.spaceBtwItems / 2),

            /// -- Texts
            // [Expanded] & Column [MainAxisSize.min] is important to keep the elements in the vertical center and also
            // to keep text inside the boundaries.
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YbBrandTitleWithVerifiedIcon(title: brand.name, brandTextSize: TextSize.large),
                  Text(
                    '${brand.productsCount ?? 0} products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}