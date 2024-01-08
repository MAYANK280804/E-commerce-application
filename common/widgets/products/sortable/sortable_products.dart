import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/all_products_controller.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class YbSortableProducts extends StatelessWidget {
  const YbSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) => controller.sortProducts(value!),
          value: controller.selectedSortOption.value,
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: YbSizes.spaceBtwSections),
        Obx(
          () => YbGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) => YbProductCardVertical(product: controller.products[index], isNetworkImage: true),
          ),
        ),
        SizedBox(height: YbDeviceUtils.getBottomNavigationBarHeight() + YbSizes.defaultSpace),
      ],
    );
  }
}
