import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/onboarding_controller.dart';

class TOnBoardingNextButton extends StatelessWidget {
  const TOnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = YbHelperFunctions.isDarkMode(context);
    return Positioned(
      right: YbSizes.defaultSpace,
      bottom: YbDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: dark ? YbColors.primary : Colors.black),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
