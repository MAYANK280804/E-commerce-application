import 'package:YumeBazaar/common/widgets/products/cart/cart_menu_icon.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../../../common/widgets/appbar/appbar.dart';

import '../../../../common/widgets/loaders/animation_loader.dart';

import '../../../../home_menu.dart';

import '../../../../utils/constants/image_strings.dart';

import '../../../../utils/constants/sizes.dart';

import '../../controllers/product/cart_controller.dart';

import '../checkout/checkout.dart';

import 'widgets/cart_items.dart';


class CartScreen extends StatelessWidget {

  const CartScreen({super.key});


  @override

  Widget build(BuildContext context) {

    final controller = CartController.instance;

    final cartItems = controller.cartItems;

    return Scaffold(

      /// -- AppBar

      appBar: YbAppBar(

        showBackArrow: false,

        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),

        actions: const [YbCartCounterIcon()],

      ),

      body: Obx(() {

        /// Nothing Found Widget

        final emptyWidget = YbAnimationLoaderWidget(

          text: 'Whoops! Cart is EMPTY.',

          animation: YbImages.cartAnimation,

          showAction: true,

          actionText: 'Let\'s fill it',

          onActionPressed: () => Get.off(() => const HomeMenu()),

        );


        /// Cart Items

        return cartItems.isEmpty

            ? emptyWidget

            : const SingleChildScrollView(

                child: Padding(

                  padding: EdgeInsets.all(YbSizes.defaultSpace),


                  /// -- Items in Cart

                  child: YbCartItems(),

                ),

              );

      }),


      /// -- Checkout Button

      bottomNavigationBar: Obx(

        () {

          return cartItems.isNotEmpty

              ? Padding(

                  padding: const EdgeInsets.only(bottom: 100, left: 24, right: 24, top: 24),

                  child: SizedBox(

                    width: double.infinity,

                    child: ElevatedButton(

                      onPressed: () => Get.to(() => const CheckoutScreen()),

                      child: Obx(() => Text('Checkout Rs ${controller.totalCartPrice.value}')),

                    ),

                  ),

                )

              : const SizedBox();

        },

      ),

    );

  }

}

