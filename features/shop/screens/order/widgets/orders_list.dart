import 'package:YumeBazaar/common/widgets/loaders/animation_loader.dart';

import 'package:YumeBazaar/utils/constants/image_strings.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';

import '../../../../../home_menu.dart';

import '../../../../../utils/constants/colors.dart';

import '../../../../../utils/constants/sizes.dart';

import '../../../../../utils/helpers/cloud_helper_functions.dart';

import '../../../../../utils/helpers/helper_functions.dart';

import '../../../controllers/product/order_controller.dart';


class TOrderListItems extends StatelessWidget {

  const TOrderListItems({super.key});


  @override

  Widget build(BuildContext context) {

    final controller = Get.put(OrderController());

    return FutureBuilder(

        future: controller.fetchUserOrders(),

        builder: (_, snapshot) {

          /// Nothing Found Widget

          final emptyWidget = YbAnimationLoaderWidget(

            text: 'Whoops! No Orders Yet!',

            animation: YbImages.orderCompletedAnimation,

            showAction: true,

            actionText: 'Let\'s fill it',

            onActionPressed: () => Get.off(() => const HomeMenu()),

          );


          /// Helper Function: Handle Loader, No Record, OR ERROR Message

          final response = YbCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: emptyWidget);

          if (response != null) return response;


          /// Congratulations 🎊 Record found.

          final orders = snapshot.data!;

          return ListView.separated(

            shrinkWrap: true,

            itemCount: orders.length,

            separatorBuilder: (_, index) => const SizedBox(height: YbSizes.spaceBtwItems),

            itemBuilder: (_, index) {

              final order = orders[index];

              return YbRoundedContainer(

                showBorder: true,

                backgroundColor: YbHelperFunctions.isDarkMode(context) ? YbColors.dark : YbColors.light,

                child: Column(

                  children: [

                    /// -- Top Row

                    Row(

                      children: [

                        /// 1 - Image

                        const Icon(Iconsax.ship),

                        const SizedBox(width: YbSizes.spaceBtwItems / 2),


                        /// 2 - Status & Date

                        Expanded(

                          child: Column(

                            mainAxisSize: MainAxisSize.min,

                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [

                              Text(

                                order.orderStatusText,

                                overflow: TextOverflow.ellipsis,

                                style: Theme.of(context).textTheme.bodyLarge!.apply(color: YbColors.primary, fontWeightDelta: 1),

                              ),

                              Text(order.formattedOrderDate, style: Theme.of(context).textTheme.headlineSmall),

                            ],

                          ),

                        ),


                        /// 3 - Icon

                        IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34, size: YbSizes.iconSm)),

                      ],

                    ),

                    const SizedBox(height: YbSizes.spaceBtwItems),


                    /// -- Bottom Row

                    Row(

                      children: [

                        /// Order No

                        Expanded(

                          child: Row(

                            children: [

                              /// 1 - Icon

                              const Icon(Iconsax.tag),

                              const SizedBox(width: YbSizes.spaceBtwItems / 2),


                              /// Order

                              Flexible(

                                child: Column(

                                  mainAxisSize: MainAxisSize.min,

                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [

                                    Text(

                                      'Order',

                                      maxLines: 1,

                                      overflow: TextOverflow.ellipsis,

                                      style: Theme.of(context).textTheme.labelMedium,

                                    ),

                                    Text(

                                      order.id,

                                      maxLines: 1,

                                      overflow: TextOverflow.ellipsis,

                                      style: Theme.of(context).textTheme.titleMedium,

                                    ),

                                  ],

                                ),

                              ),

                            ],

                          ),

                        ),


                        /// Delivery Date

                        Expanded(

                          child: Row(

                            children: [

                              /// 1 - Icon

                              const Icon(Iconsax.calendar),

                              const SizedBox(width: YbSizes.spaceBtwItems / 2),


                              /// Status & Date

                              Flexible(

                                child: Column(

                                  mainAxisSize: MainAxisSize.min,

                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [

                                    Text(

                                      'Shipping Date',

                                      maxLines: 1,

                                      overflow: TextOverflow.ellipsis,

                                      style: Theme.of(context).textTheme.labelMedium,

                                    ),

                                    Text(

                                      order.formattedDeliveryDate,

                                      maxLines: 1,

                                      overflow: TextOverflow.ellipsis,

                                      style: Theme.of(context).textTheme.titleMedium,

                                    ),

                                  ],

                                ),

                              ),

                            ],

                          ),

                        ),

                      ],

                    ),

                  ],

                ),

              );

            },

          );

        });

  }

}

