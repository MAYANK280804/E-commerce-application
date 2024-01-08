import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/onboarding_controller.dart';

class TOnBoardingSkipButton extends StatelessWidget {
  const TOnBoardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      top: YbDeviceUtils.geYbAppBarHeight(),
      right: YbSizes.defaultSpace,
      child: TextButton(onPressed: controller.skipPage, child: const Text('Skip')),
    );
  }
}
