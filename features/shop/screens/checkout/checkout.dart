import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/products/cart/billing_amount_section.dart';
import '../../../../common/widgets/products/cart/coupon_code.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/helpers/pricing_calculator.dart';
import '../../../../utils/popups/loaders.dart';
import '../../controllers/dummy_data.dart';
import '../../controllers/product/cart_controller.dart';
import '../../controllers/product/order_controller.dart';
import '../cart/widgets/cart_items.dart';
import 'widgets/billing_address_section.dart';
import 'widgets/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = YbPricingCalculator.calculateTotalPrice(subTotal, 'US');
    final dark = YbHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const YbAppBar(title: Text('Order Review'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(YbSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// -- Items in Cart
              const YbCartItems(showAddRemoveButtons: false),
              const SizedBox(height: YbSizes.spaceBtwSections),

              /// -- Coupon TextField
              const YbCouponCode(),
              const SizedBox(height: YbSizes.spaceBtwSections),

              /// -- Billing Section
              YbRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(YbSizes.md),
                backgroundColor: dark ? YbColors.black : YbColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    YbBillingAmountSection(subTotal: subTotal),
                    const SizedBox(height: YbSizes.spaceBtwItems),

                    /// Divider
                    const Divider(),
                    const SizedBox(height: YbSizes.spaceBtwItems),

                    /// Payment Methods
                    const TBillingPaymentSection(),
                    const SizedBox(height: YbSizes.spaceBtwSections),

                    /// Address
                    TBillingAddressSection(
                      name: TDummyData.user.fullName,
                      phoneNumber: TDummyData.user.formattedPhoneNo,
                      address: TDummyData.user.addresses.toString(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: YbSizes.spaceBtwSections),
            ],
          ),
        ),
      ),

      /// -- Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(YbSizes.defaultSpace),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: subTotal > 0
                ? () => orderController.processOrder(totalAmount)
                : () => TLoaders.warningSnackBar(title: 'Empty Cart', message: 'Add items in the cart in order to proceed.'),
            child: Text('Checkout Rs$totalAmount'),
          ),
        ),
      ),
    );
  }
}
