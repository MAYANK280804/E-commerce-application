import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/signup_controller.dart';
import 'terms_conditions_checkbox.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          const SizedBox(height: YbSizes.spaceBtwSections),

          /// First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => YbValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: YbTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: YbSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => YbValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: YbTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: YbSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            controller: controller.username,
            validator: YbValidator.validateUsername,
            expands: false,
            decoration: const InputDecoration(labelText: YbTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: YbSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            controller: controller.email,
            validator: YbValidator.validateEmail,
            decoration: const InputDecoration(labelText: YbTexts.email, prefixIcon: Icon(Icons.email)),
          ),
          const SizedBox(height: YbSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: YbValidator.validatePhoneNumber,
            decoration: const InputDecoration(labelText: YbTexts.phoneNo, prefixIcon: Icon(Iconsax.call5)),
          ),
          const SizedBox(height: YbSizes.spaceBtwInputFields),

          /// Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: YbValidator.validatePassword,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: YbTexts.password,
                prefixIcon: const Icon(Iconsax.password_check5),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash5 : Iconsax.eye4),
                ),
              ),
            ),
          ),
          const SizedBox(height: YbSizes.spaceBtwSections),

          /// Terms&Conditions Checkbox
          const TTermsAndConditionCheckbox(),
          const SizedBox(height: YbSizes.spaceBtwSections),

          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () => controller.signup(), child: const Text(YbTexts.createAccount)),
          ),
        ],
      ),
    );
  }
}
