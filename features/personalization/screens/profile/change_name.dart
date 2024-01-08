import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';
import '../../controllers/update_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      /// Custom Appbar
      appBar: YbAppBar(
        showBackArrow: true,
        title: Text('Change Personal Information', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(YbSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Headings
              Text(
                'Use real name for easy verification. This name will appear on several pages.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: YbSizes.spaceBtwSections),

              /// Text field and Button
              Form(
                  key: controller.updateUserNameFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.firstName,
                        validator: (value) => YbValidator.validateEmptyText('First name', value),
                        expands: false,
                        decoration: const InputDecoration(labelText: YbTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                      ),
                      const SizedBox(height: YbSizes.spaceBtwInputFields),
                      TextFormField(
                        controller: controller.lastName,
                        validator: (value) => YbValidator.validateEmptyText('Last name', value),
                        expands: false,
                        decoration: const InputDecoration(labelText: YbTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                      ),
                      const SizedBox(height: YbSizes.spaceBtwInputFields),
                      TextFormField(
                        controller: controller.email,
                        validator: (value) => YbValidator.validateEmail(value),
                        expands: false,
                        decoration: const InputDecoration(labelText: YbTexts.email, prefixIcon: Icon(Iconsax.activity1)),
                      ),
                      const SizedBox(height: YbSizes.spaceBtwInputFields),
                      TextFormField(
                        controller: controller.phoneNumber,
                        validator: (value) => YbValidator.validatePhoneNumber(value),
                        expands: false,
                        decoration: const InputDecoration(labelText: YbTexts.phoneNo, prefixIcon: Icon(Iconsax.airdrop)),
                      ),
                    ],
                  )),
              const SizedBox(height: YbSizes.spaceBtwSections),

              /// Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text('Save')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
