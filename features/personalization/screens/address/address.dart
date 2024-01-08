import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/loaders/circular_loader.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/address_controller.dart';
import 'add_new_address.dart';
import 'widgets/single_address_widget.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: YbAppBar(
        showBackArrow: true,
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(YbSizes.defaultSpace),
        child: Obx(
          () => FutureBuilder(
            // Use key to trigger refresh
            key: Key(controller.refreshData.value.toString()),
            future: controller.allUserAddresses(),
            builder: (_, snapshot) {
              /// Helper Function: Handle Loader, No Record, OR ERROR Message
              final response = YbCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
              if (response != null) return response;

              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => TSingleAddress(
                  address: snapshot.data![index],
                  onTap: () async {
                    Get.defaultDialog(
                      title: '',
                      onWillPop: () async {
                        return false;
                      },
                      barrierDismissible: false,
                      backgroundColor: Colors.transparent,
                      content: const YbCircularLoader(),
                    );
                    await controller.selectAddress(snapshot.data![index]);
                    Get.back();
                  },
                ),
              );
            },
          ),
        ),
      ),

      /// Add new Address button
      floatingActionButton: FloatingActionButton(
        backgroundColor: YbColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: YbColors.white),
      ),
    );
  }
}
