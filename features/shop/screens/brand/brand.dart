import 'package:YumeBazaar/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/brand_controller.dart';
import '../../models/brand_model.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: const YbAppBar(showBackArrow: true, title: Text('Brand')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(YbSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              YbBrandCard(brand: brand, showBorder: true),
              const SizedBox(height: YbSizes.spaceBtwSections),

              /// Sub Categories
              const YbSectionHeading(title: 'Products', showActionButton: false),
              const SizedBox(height: YbSizes.spaceBtwItems),
              FutureBuilder(
                  future: controller.getBrandProducts(brand.id, -1),
                  builder: (context, snapshot) {
                    /// Handle Loader, No Record, OR Error Message
                    const loader = YbVerticalProductShimmer();
                    final widget = YbCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    /// Record Found!
                    final brandProducts = snapshot.data!;
                    return YbSortableProducts(products: brandProducts);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
