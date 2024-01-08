import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../common/widgets/texts/section_heading.dart';

import '../../../../utils/constants/image_strings.dart';

import '../../../../utils/constants/sizes.dart';

import '../../models/payment_method_model.dart';

import '../../screens/checkout/widgets/payment_tile.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(name: 'Paypal', image: YbImages.paypal);

    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(YbSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YbSectionHeading(title: 'Select Payment Method'),
              const SizedBox(height: YbSizes.spaceBtwSections),
              YbPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paypal', image: YbImages.paypal)),
              const SizedBox(height: YbSizes.spaceBtwItems / 2),
              YbPaymentTile(paymentMethod: PaymentMethodModel(name: 'Google Pay', image: YbImages.googlePay)),
              const SizedBox(height: YbSizes.spaceBtwItems / 2),
              YbPaymentTile(paymentMethod: PaymentMethodModel(name: 'Apple Pay', image: YbImages.applePay)),
              const SizedBox(height: YbSizes.spaceBtwItems / 2),
              YbPaymentTile(paymentMethod: PaymentMethodModel(name: 'VISA', image: YbImages.visa)),
              const SizedBox(height: YbSizes.spaceBtwItems / 2),
              YbPaymentTile(paymentMethod: PaymentMethodModel(name: 'Master Card', image: YbImages.masterCard)),
              const SizedBox(height: YbSizes.spaceBtwItems / 2),
              YbPaymentTile(paymentMethod: PaymentMethodModel(name: 'Khalti', image: YbImages.khalti)),
              const SizedBox(height: YbSizes.spaceBtwItems / 2),
              YbPaymentTile(paymentMethod: PaymentMethodModel(name: 'esewa', image: YbImages.esewa)),
              const SizedBox(height: YbSizes.spaceBtwItems / 2),
              YbPaymentTile(paymentMethod: PaymentMethodModel(name: 'Credit Card', image: YbImages.creditCard)),
              const SizedBox(height: YbSizes.spaceBtwItems / 2),
              const SizedBox(height: YbSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
