import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/checkout_controller.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return Column(
      children: [
        YbSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          showActionButton: true,
          onPressed: () {
            controller.selectPaymentMethod(context);
          },
        ),
        const SizedBox(height: YbSizes.spaceBtwItems / 2),
        Obx(
          () => Row(
            children: [
              YbRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: YbHelperFunctions.isDarkMode(context) ? YbColors.light : YbColors.white,
                padding: const EdgeInsets.all(YbSizes.sm),
                child: Image(image: AssetImage(controller.selectedPaymentMethod.value.image), fit: BoxFit.contain),
              ),
              const SizedBox(width: YbSizes.spaceBtwItems / 2),
              Text(controller.selectedPaymentMethod.value.name, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ],
    );
  }
}
