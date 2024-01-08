import 'package:YumeBazaar/utils/device/device_utility.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup_controller.dart';

class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        /// CHECKBOX => Wrap in a Sized box to remove extra padding
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(value: controller.privacyPolicy.value, onChanged: (value) => controller.privacyPolicy.value = value!),
          ),
        ),
        const SizedBox(width: YbSizes.md),
        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '${YbTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: YbTexts.privacyPolicy,
                  recognizer: TapGestureRecognizer()..onTap = () => YbDeviceUtils.launchWebsiteUrl('https://codingwitht.com/'),
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: YbHelperFunctions.isDarkMode(context) ? YbColors.white : YbColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: YbHelperFunctions.isDarkMode(context) ? YbColors.white : YbColors.primary,
                      ),
                ),
                TextSpan(text: ' ${YbTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: YbTexts.termsOfUse,
                  recognizer: TapGestureRecognizer()..onTap = () => YbDeviceUtils.launchWebsiteUrl('https://codingwitht.com/'),
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: YbHelperFunctions.isDarkMode(context) ? YbColors.white : YbColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: YbHelperFunctions.isDarkMode(context) ? YbColors.white : YbColors.primary,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
